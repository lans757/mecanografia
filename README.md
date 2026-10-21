# 😊 Mecanografía Feliz

Programa para que niñas y niños de 6.º grado y 1.er año (11-13 años) aprendan a escribir con los diez dedos.
Funciona **sin internet**.

🌐 **Juega ahora en el navegador:** https://mecanografia-feliz.vercel.app
📥 **Descarga para Windows y Linux:** [Releases](https://github.com/lans757/mecanografia/releases) · [Guía de instalación](INSTALACION.md)

## Para el docente

### Instalar en las computadoras

📥 **Guía paso a paso: [INSTALACION.md](INSTALACION.md)**. Explica cómo instalar en Windows, usarlo desde un pendrive, Linux y el navegador, y cómo resolver los problemas más comunes.

| Archivo (carpeta `salida/`) | Para qué sirve |
|---|---|
| `Instalar-MecanografiaFeliz.exe` (2.9 MB) | **Lo recomendado.** Instala el programa y crea el ícono en el escritorio y en el menú Inicio. No pide contraseña de administrador. |
| `MecanografiaFeliz-portable/` (2.5 MB) | Para llevar en un pendrive sin instalar nada. Son **dos archivos que deben ir juntos**: `MecanografiaFeliz.exe` y `resources.neu`. |
| `MecanografiaFeliz-linux/` | Lo mismo, para computadoras con Linux (por ejemplo, Canaima). |
| `mecanografia-feliz.html` | Para abrir con doble clic en Chrome, Edge o Firefox, en cualquier sistema. |

**Requisito en Windows:** *Microsoft Edge WebView2*. Ya viene incluido en Windows 11 y en Windows 10 actualizado. Si falta, el instalador avisa y da el enlace de descarga.

> ⚠️ **Aviso de Windows "Windows protegió su PC" o "bloqueado por Smart App Control"**: el programa no tiene firma digital (cuesta dinero, ver `PENDIENTE.md`). En el aviso azul de SmartScreen se pulsa **"Más información → Ejecutar de todas formas"**. En el equipo donde se construyó, que tiene Smart App Control activado, el instalador y el programa funcionaron sin bloqueo. Aun así, Windows decide equipo por equipo, así que conviene probar en una computadora de la escuela antes de instalarlo en todas.

### Cómo funciona

- **📖 Cómo jugar:** pantalla con 10 pasos para los niños (postura, fila guía, estrellas, mayúsculas, acentos, competencia), las reglas del juego limpio y qué significan *ppm* y *precisión*. Se abre desde la barra de arriba, el menú y la pantalla de crear jugador.
- **Empieza a escribir de una vez, sin registrarse:** el programa abre directo en las lecciones, como **invitado**. Al terminar una lección o un juego, el niño escribe su **alias** para guardar, como cuando se ponen las iniciales en una máquina arcade. Cada alias escrito se guarda como un jugador nuevo, aunque el nombre se repita: no se pregunta "¿eres tú?", porque es fácil mentir. Los que **no** escriben alias igual cuentan: sus partidas se juntan en un **promedio de invitados**, que aparece en el Salón de la Fama y en la zona del docente. No hay contraseña, el avatar y el color se asignan al azar, y hay un filtro de palabras inapropiadas. Quien ya tiene alias puede elegirlo antes en **👤 Jugadores**.
- **22 lecciones:** la fila guía, todas las letras, comas y puntos, mayúsculas, acentos, `¿? ¡!`, números, **símbolos de programador**, **código de PSeInt**, frases del cole y un cuento final. Se ganan de 1 a 3 estrellas (3 estrellas = 95 % de precisión o más).
- **🏆 Salón de la Fama:** tabla de récords estilo arcade con los 10 mejores de cada competencia: Desafío de 1 minuto, Lluvia de letras (3 niveles), Reto de atajos y Estrellas. Las tablas van rotando solas, como en las máquinas de los años 80.
- **🌧️ Lluvia de letras y de palabras con velocidad a elegir:** antes de empezar, un contador del 1 (🐢 tranquilo) al 15 (🚀 experto) permite que quien ya escribe rápido empiece más arriba. El programa recuerda la última velocidad de cada modo, y durante el juego la velocidad sigue subiendo sola cada 10 aciertos.
- **⌨️ Atajos del teclado:** Ctrl+C, Ctrl+Z, Alt+Tab, Win+D y otros, explicados para niños. Los que se pueden probar dentro del programa se iluminan al pulsarlos. Hay también un **Reto de atajos** de 1 minuto.
- **⚙️ Ajustes:**
  - **Modo sin mirar:** esconde el teclado de la pantalla y las pistas. Si el niño se equivoca 3 veces seguidas en la misma letra, la ayuda vuelve a aparecer. También se activa con el botón 🙈 durante la lección.
  - **Teclado Latinoamérica o España:** cambia el dibujo del teclado y las pistas. Por ejemplo, en el teclado de España la `{` se escribe con **AltGr**. Para saber cuál es: si el teclado tiene la tecla **Ç**, es de España.
  - Sonido y colores de dedos.

### Zona del docente (borrar jugadores)

En **🏆 Récords → 🔧 Docente**. La primera vez se crea un **PIN** de 4 a 8 números. Desde ahí se pueden borrar alias de prueba o inapropiados.

¿Olvidaste el PIN? Cierra el programa, abre `%APPDATA%\MecanografiaFeliz\datos.json` con el Bloc de notas, cambia `"pin":"1234"` por `"pin":null` y guarda.

### Dónde se guardan los datos

- **Programa (.exe):** `%APPDATA%\MecanografiaFeliz\datos.json`. Al abrir el programa se hace una copia en `datos-respaldo.json`. Desinstalar **no** borra los datos.
- **Versión HTML:** dentro del navegador. Si se borra el historial del navegador, se pierden.

Cada computadora tiene su propio Salón de la Fama. Un ranking compartido entre varias computadoras está en `PENDIENTE.md`.

## Para quien programa

```
resources/index.html     ← TODA la aplicación (HTML + CSS + JS en un archivo)
resources/js/neutralino.js
resources/icons/icono.png
recursos/icono.svg|.ico  ← ícono (el .ico va al .exe y al instalador)
neutralino.config.json   ← ventana, permisos y versión
instalador.iss           ← instalador (Inno Setup 6)
scripts/construir.mjs    ← arma todo lo de salida/
```

```bash
npm install          # una vez
npm run app          # abre el programa en modo desarrollo
npm run construir    # crea salida/ (.exe, instalador, Linux y HTML)
```

Para construir se necesita Node.js e [Inno Setup 6](https://jrsoftware.org/isdl.php). Los binarios de Neutralino se descargan solos la primera vez.

Decisiones técnicas:

- **Neutralino** en lugar de Electron: el programa pesa 2.5 MB en vez de ~100 MB, porque usa el WebView2 que ya trae Windows.
- **Recursos en `resources.neu`, no incrustados en el .exe:** Smart App Control de Windows 11 **bloqueó** el .exe con los recursos incrustados (`--embed-resources`). Con el archivo aparte, no lo bloqueó.
- **Detección del modo programa:** Neutralino pone sus variables `NL_*` dentro de `js/neutralino.js`, no en la página. Por eso `index.html` siempre intenta cargar ese archivo y luego revisa si existe `NL_PORT`. En el navegador no existe, y la página guarda en `localStorage`.
- Para probar el .exe con Playwright: `WEBVIEW2_ADDITIONAL_BROWSER_ARGUMENTS=--remote-debugging-port=9333` y `chromium.connectOverCDP`. Hay que lanzarlo con una ruta con `\`: con `/`, Neutralino no encuentra `resources.neu` y abre neutralino.js.org.

## Autor y contacto

Hecho por **Leonardo Caripa** como herramienta educativa libre.

- ✉️ [leonardocaripadev@gmail.com](mailto:leonardocaripadev@gmail.com)
- GitHub: [github.com/lans757](https://github.com/lans757) · [github.com/caripadev](https://github.com/caripadev)

¿Ideas, errores o quieres usarlo en tu escuela? Escribe al correo o abre un *issue*.

## Licencia

[MIT](LICENSE): cualquiera puede usarlo, copiarlo, modificarlo y compartirlo gratis, siempre que conserve el aviso de autoría.

## Origen

Nació como complemento del curso de PSeInt (`curso-pseint/curso-pseint/complementos/mecanografia/`), donde sigue la versión simple original.
