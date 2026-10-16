# 📥 Cómo instalar Mecanografía Feliz

Guía para docentes y encargados de computación. No hace falta saber de informática.

## Antes de empezar: ¿qué versión necesito?

| Si en la escuela… | Usa | Ve a |
|---|---|---|
| Las computadoras tienen **Windows 10 u 11** | `Instalar-MecanografiaFeliz.exe` | [Paso a paso](#-instalar-en-windows-recomendado) |
| No se puede instalar nada, o quieres llevarlo en **pendrive** | Carpeta `MecanografiaFeliz-portable` | [Sin instalar](#-usar-sin-instalar-pendrive) |
| Las computadoras tienen **Linux** (por ejemplo, Canaima) | Carpeta `MecanografiaFeliz-linux` | [Linux](#-linux-canaima) |
| Hay **internet** y no quieres instalar nada | La página web | [https://mecanografia-feliz.vercel.app](https://mecanografia-feliz.vercel.app) |
| No hay internet y nada de lo anterior funciona | `mecanografia-feliz.html` | [En el navegador](#-en-el-navegador-funciona-en-cualquier-equipo) |

Todos los archivos se descargan de **[Releases](https://github.com/lans757/mecanografia/releases)** en GitHub. **No se necesita internet** para usar el programa, solo para descargarlo.

---

## 🪟 Instalar en Windows (recomendado)

1. Copia `Instalar-MecanografiaFeliz.exe` a la computadora. Sirve un pendrive o descargarlo directamente.
2. Haz **doble clic** en el archivo.
3. Si aparece la ventana azul **"Windows protegió su PC"**:
   1. Haz clic en **Más información**.
   2. Haz clic en **Ejecutar de todas formas**.

   *Es normal: el programa es gratuito y no tiene firma digital. Ver [Problemas frecuentes](#-problemas-frecuentes).*
4. Elige **para quién instalarlo**:
   - **"Instalar para mí solamente"**: no pide contraseña de administrador.
   - **"Instalar para todos los usuarios"**: pide la contraseña de administrador. Úsalo si cada estudiante entra con su propia cuenta de Windows.
5. Lee la licencia, marca **"Acepto el acuerdo"** y pulsa **Siguiente**.
6. Deja marcada la casilla **"Crear un acceso directo en el escritorio"** y pulsa **Siguiente → Instalar**.
7. Al terminar, deja marcado **"Abrir Mecanografía Feliz"** y pulsa **Finalizar**.

✅ **Listo.** El ícono amarillo con la carita 😊 queda en el escritorio y en el menú Inicio.

### Para varias computadoras
Repite los pasos en cada equipo con el mismo instalador. El técnico de la escuela también puede instalarlo **sin ventanas**, desde la consola:

```
Instalar-MecanografiaFeliz.exe /VERYSILENT /CURRENTUSER
```

---

## 🎒 Usar sin instalar (pendrive)

1. Copia la carpeta **`MecanografiaFeliz-portable`** completa al pendrive o a la computadora.
2. Abre la carpeta y haz doble clic en **`MecanografiaFeliz.exe`**.

> ⚠️ Dentro hay **dos archivos** (`MecanografiaFeliz.exe` y `resources.neu`). **Siempre deben estar juntos** en la misma carpeta. Si copias solo el `.exe`, el programa abre una página de internet en lugar del juego.

El progreso **no** se guarda en el pendrive: queda en cada computadora donde se use.

---

## 🐧 Linux (Canaima)

> Esta versión todavía **no se ha probado** en una Canaima. Si la pruebas, cuéntanos cómo te fue.

1. Copia la carpeta **`MecanografiaFeliz-linux`** a la computadora.
2. Abre una terminal dentro de esa carpeta y escribe:
   ```
   chmod +x MecanografiaFeliz
   ./MecanografiaFeliz
   ```
3. Si no abre, probablemente falta el componente **WebKitGTK**. En Debian o Canaima se instala con:
   ```
   sudo apt install libwebkit2gtk-4.1-0
   ```
   Si no hay internet para instalarlo, usa la [versión del navegador](#-en-el-navegador-funciona-en-cualquier-equipo).

---

## 🌐 En el navegador (funciona en cualquier equipo)

**Con internet:** entra a **https://mecanografia-feliz.vercel.app**. No hay que descargar nada.

**Sin internet:**
1. Copia **`mecanografia-feliz.html`** a la computadora.
2. Haz **doble clic**: se abre en Chrome, Edge o Firefox.

Es el mismo juego. La diferencia es que el progreso se guarda **en el navegador**: si se borra el historial, se pierden las estrellas y los récords. No uses ventanas de incógnito.

---

## 🔧 Primera vez que se abre (docente)

1. Ve a **🏆 Récords → 🔧 Docente** y crea un **PIN** de 4 a 8 números. Anótalo en un lugar seguro. Sirve para borrar alias inapropiados.
2. En **⚙️ Ajustes → Teclado**, elige **Latinoamérica** o **España**. Si el teclado tiene la tecla **Ç**, es de España.
3. Pide a cada estudiante que cree su jugador con **➕ Nuevo jugador**.

---

## 🔄 Actualizar a una versión nueva

Ejecuta el instalador nuevo encima del anterior. **Los jugadores, las estrellas y los récords se conservan.**

## 🗑️ Desinstalar

**Configuración → Aplicaciones → Aplicaciones instaladas → Mecanografía Feliz → Desinstalar.**

Desinstalar **no borra** el progreso de los estudiantes, por si se vuelve a instalar. Para borrarlo todo:

1. Pulsa las teclas `Win` + `R`.
2. Escribe `%APPDATA%` y pulsa Enter.
3. Borra la carpeta **MecanografiaFeliz**.

---

## ❓ Problemas frecuentes

**"Windows protegió su PC" (ventana azul)**
→ **Más información → Ejecutar de todas formas.** Pasa porque el programa no tiene firma digital, que cuesta dinero.

**"Smart App Control bloqueó parte de esta aplicación"** (aviso sin botón para continuar)
→ Algunas computadoras con Windows 11 tienen activado *Smart App Control*, que no deja abrir programas sin firma. En la computadora donde se hizo el programa funcionó con esta protección activa, pero Windows decide equipo por equipo. Si te pasa, usa la [versión del navegador](#-en-el-navegador-funciona-en-cualquier-equipo), que funciona igual.

**El instalador dice que falta "Microsoft Edge WebView2"**
→ Descárgalo gratis en <https://go.microsoft.com/fwlink/p/?LinkId=2124703>, instálalo y vuelve a ejecutar el instalador. Windows 11 ya lo trae, y Windows 10 actualizado también.

**Se abre una página de internet en vez del juego**
→ Falta el archivo `resources.neu` junto al `.exe` (versión portable). Copia la carpeta completa.

**Las letras que aparecen no coinciden con las teclas**
→ Revisa en **⚙️ Ajustes → Teclado** que esté elegido el teclado correcto (Latinoamérica o España). Revisa también que Windows tenga configurado el mismo teclado.

**Olvidé el PIN del docente**
→ Cierra el programa. Pulsa `Win` + `R`, escribe `%APPDATA%\MecanografiaFeliz\datos.json` y ábrelo con el Bloc de notas. Cambia `"pin":"1234"` (con tu número) por `"pin":null` y guarda. La próxima vez podrás crear un PIN nuevo.

**¿Algo más?** Escribe a ✉️ [leonardocaripadev@gmail.com](mailto:leonardocaripadev@gmail.com).
