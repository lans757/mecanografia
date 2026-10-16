// Construye Mecanografía Feliz:  npm run construir
//
// Deja en la carpeta "salida/":
//   Instalar-MecanografiaFeliz.exe        -> instalador con accesos directos
//   MecanografiaFeliz-portable/           -> programa sin instalar (para pendrive)
//   MecanografiaFeliz-linux/              -> versión para Linux (Canaima, etc.)
//   mecanografia-feliz.html               -> versión para abrir en el navegador
//
// Los recursos van en un archivo aparte (resources.neu) y NO incrustados en el .exe:
// Smart App Control de Windows 11 bloquea el .exe con recursos incrustados.
import { execSync } from "node:child_process";
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { rcedit } from "rcedit";

const raiz = path.join(path.dirname(fileURLToPath(import.meta.url)), "..");
const config = JSON.parse(fs.readFileSync(path.join(raiz, "neutralino.config.json"), "utf8"));
const version = config.version;
const sh = cmd => execSync(cmd, { cwd: raiz, stdio: "inherit" });
const salida = path.join(raiz, "salida");

// 1. Binarios de Neutralino (se descargan la primera vez)
const binWin = path.join(raiz, "bin", "neutralino-win_x64.exe");
if (!fs.existsSync(binWin)) sh("npx neu update");

// 2. Ícono del .exe de Windows (nombre, autor y copyright los pone "neu build"
//    a partir de neutralino.config.json)
console.log("» Poniendo el ícono al .exe");
await rcedit(binWin, { icon: path.join(raiz, "recursos", "icono.ico") });

// 3. Empaquetar: los archivos de resources/ quedan en resources.neu
console.log("» Empaquetando con Neutralino");
sh("npx neu build --release");

// 4. Copiar lo que se reparte a salida/
fs.rmSync(salida, { recursive: true, force: true });
fs.mkdirSync(salida);
const dist = path.join(raiz, "dist", config.cli.binaryName);
const copiar = (desde, carpeta, nombre) => {
  fs.mkdirSync(path.join(salida, carpeta), { recursive: true });
  fs.copyFileSync(path.join(dist, desde), path.join(salida, carpeta, nombre));
};
copiar(`${config.cli.binaryName}-win_x64.exe`, "MecanografiaFeliz-portable", "MecanografiaFeliz.exe");
copiar("resources.neu", "MecanografiaFeliz-portable", "resources.neu");
copiar(`${config.cli.binaryName}-linux_x64`, "MecanografiaFeliz-linux", "MecanografiaFeliz");
copiar("resources.neu", "MecanografiaFeliz-linux", "resources.neu");
fs.copyFileSync(path.join(raiz, "resources", "index.html"), path.join(salida, "mecanografia-feliz.html"));

// 5. Instalador de Windows con Inno Setup
const posibles = [
  path.join(process.env.LOCALAPPDATA || "", "Programs", "Inno Setup 6", "ISCC.exe"),
  "C:\Program Files (x86)\Inno Setup 6\ISCC.exe",
  "C:\Program Files\Inno Setup 6\ISCC.exe"
];
const iscc = posibles.find(p => fs.existsSync(p));
if (iscc) {
  console.log("» Creando el instalador");
  sh(`"${iscc}" /Q /DVersion=${version} instalador.iss`);
} else {
  console.log("⚠ No se encontró Inno Setup 6: se omitió el instalador. Instálalo desde https://jrsoftware.org/isdl.php");
}

console.log("\n✔ Listo. Archivos en salida/:");
const tamano = f => { const s = fs.statSync(f); return s.isDirectory() ? fs.readdirSync(f).reduce((t, x) => t + tamano(path.join(f, x)), 0) : s.size; };
for (const f of fs.readdirSync(salida)) console.log(`   ${f}  (${(tamano(path.join(salida, f)) / 1048576).toFixed(1)} MB)`);
