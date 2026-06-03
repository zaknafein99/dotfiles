# Walkthrough: Configuración Premium de WezTerm

¡La configuración se ha implementado de manera exitosa y está completamente lista para su uso! A continuación, se detalla un resumen de los cambios realizados, las características estéticas y prácticas añadidas, y cómo puedes disfrutar de ella.

## Cambios Realizados

1. **Limpieza y Respaldo de Configuración Heredada**: Se renombró el archivo heredado `/home/isma/.wezterm.lua` a `.wezterm.lua.bak`. WezTerm prioriza este archivo en el home, por lo que respaldarlo era indispensable para que cargue la nueva configuración moderna.
2. **Creación de Directorio**: Se creó la ruta `/home/isma/.config/wezterm`.
3. **Despliegue de Configuración**: Se escribió un archivo [wezterm.lua](file:///home/isma/.config/wezterm/wezterm.lua) estructurado y optimizado.
4. **Validación de Sintaxis**: Se comprobó mediante la CLI de `wezterm` que la configuración compila y carga de manera limpia sin ningún error en Lua.


---

## Características Estéticas (Premium & Lindo)

* **Paleta Catppuccin Mocha**: Todos los colores se adaptaron al tema de tu sistema, usando los elegantes tonos oscuros de Catppuccin Mocha con acentos azules.
* **Transparencia Activa**: Fondo semi-transparente con una opacidad del `90%` (`0.90`) que se integra de manera hermosa con el blur de Hyprland.
* **Barra de Pestañas Moderna**:
  * Desactivada la barra retro por defecto.
  * Diseñado un renderizador dinámico con Lua que muestra el número de pestaña, un icono representativo de Nerd Fonts según el proceso activo (como `` para Neovim, `` para Git, `󰡨` para Docker, etc.) y el nombre del proceso.
* **Barra de Estado Derecha**: Muestra elegantemente el espacio de trabajo actual (`󰨇`) y la hora (`󱑆`) con colores integrados.
* **Tipografía Premium**: Configurado con **JetBrainsMono Nerd Font** como fuente principal y **FiraCode Nerd Font** de respaldo, con espaciado óptimo y soporte completo de ligaduras.
* **Margen Interno (Padding)**: Añadido un margen de `12px` en todos los bordes de la ventana para una visualización más respirable de los comandos.

---

## Guía de Atajos Prácticos

Para maximizar tu productividad, se han implementado atajos intuitivos y libres de conflictos con Hyprland:

### 1. Leader Key (Tecla Guía)
* Se configuró **`Ctrl + A`** como la tecla guía (Leader), similar a tmux. Púlsala antes de presionar las siguientes teclas:
  * **`Leader + V`**: Dividir panel horizontalmente.
  * **`Leader + S`**: Dividir panel verticalmente.

### 2. Gestión de Paneles (Panes) sin Leader
* **Navegación Rápida**: Muévete instantáneamente entre paneles usando **`Alt + H / J / K / L`** o con las **`Alt + Flechas`**.
* **Redimensionamiento**: Ajusta el tamaño de tus paneles usando **`Alt + Shift + H / J / K / L`** o con **`Alt + Shift + Flechas`**.
* **Maximizar (Zoom)**: Haz zoom al panel activo usando **`Leader + Z`** (`Ctrl + A` y luego `Z`).

### 3. Gestión de Pestañas (Tabs)
* **Nueva pestaña**: `Ctrl + Shift + T`
* **Cerrar pestaña**: `Ctrl + Shift + W`
* **Navegación**: `Ctrl + Shift + [` (anterior) y `Ctrl + Shift + ]` (siguiente).
* **Ir a Pestaña Directa**: `Alt + 1` hasta `Alt + 9`.

### 4. Portapapeles
* **Copiar**: `Ctrl + Shift + C`
* **Pegar**: `Ctrl + Shift + V`

---

## Verificación de Correctitud

Se ejecutó la validación del parser de WezTerm para asegurar el correcto funcionamiento del script Lua:
```bash
wezterm show-keys
```
La compilación se completó de manera limpia, sin reportar ningún error de sintaxis en el archivo de configuración.

> [!NOTE]
> La transparencia con desenfoque (blur) se renderiza de forma nativa a nivel de compositor. Dado que usas Hyprland, verás el efecto de transparencia inmediatamente al abrir una nueva terminal WezTerm.
