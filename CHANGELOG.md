# Changelog

Formato basado en [Keep a Changelog](https://keepachangelog.com/es/1.1.0/).

## [1.2.1] - 2026-06-29

### Fixed

- Revertida la vista del panel a `fullRepresentation` inline. En esta versión de
  Plasma el `compactRepresentation` colapsa a ancho cero para un widget de solo
  texto (sin icono): el contenedor `CompactApplet` fuerza dimensiones de icono e
  ignora el ancho del contenido. El `fullRepresentation` inline sí respeta el
  `implicitWidth` y las propiedades `Layout.*` del elemento.
- Recarga de QML: `plasmashell` cachea el componente en memoria; quitar y volver
  a añadir el widget reutiliza el componente cacheado. Hace falta reiniciar
  `plasma-plasmashell.service` para que cargue el QML nuevo desde disco.

## [1.2.0] - 2026-06-29

### Changed

- La vista del panel pasa a ser `compactRepresentation` (patrón documentado),
  en vez de forzar `fullRepresentation` inline. El panel dimensiona el applet
  con las propiedades `Layout.*` del elemento de representación.

### Fixed

- El texto ya no desborda el elemento ni el panel: `Layout.preferredWidth`
  ligado al ancho del contenido con tope (`maxWidth`), label con `anchors.fill`
  + centrado + `elide`, y `clip: true` como garantía visual. Sensible al
  `formFactor` (horizontal: ancho sigue al texto; vertical: llena el ancho).

## [1.1.0] - 2026-06-29

### Added

- Ancho del widget reactivo al texto: `Layout.minimumWidth`/`Layout.preferredWidth`
  ligados al ancho implícito del label, según el patrón documentado de propiedades
  de plasmoide. El elemento crece y encoge con el nombre del escritorio activo.

## [1.0.0] - 2026-06-29

### Added

- Widget de Plasma 6 que muestra el nombre del escritorio virtual activo.
- Fuente de datos reactiva vía `TaskManager.VirtualDesktopInfo` (sin shell, sin polling).
- Arquitectura limpia en tres anillos: `logic/formatName.js` (dominio puro),
  `DesktopService.qml` (infraestructura), `DesktopLabel.qml` (presentación pura).
- Fallback `"Desktop N"` para escritorios sin nombre.
- Transición fade sutil al cambiar de escritorio (estilo Apple HIG).
- Tests unitarios de la lógica pura (6/6).
- Empaquetado Plasma 6 con `metadata.json` y validación `qmllint`.
