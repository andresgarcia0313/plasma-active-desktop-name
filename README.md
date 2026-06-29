# Active Desktop Name

Widget de KDE Plasma 6 que muestra únicamente el nombre del escritorio virtual
activo en el panel. Sin más funcionalidad.

![preview](screenshots/widget-preview-firefly.png)

## Requisitos

- KDE Plasma 6 (probado en 6.6.4)
- Qt 6 / KF6
- `org.kde.taskmanager` (incluido en Plasma)

## Instalación

```bash
kpackagetool6 --type Plasma/Applet --install .
# actualizar una versión existente:
kpackagetool6 --type Plasma/Applet --upgrade .
```

Luego: clic derecho en el panel → *Añadir o gestionar elementos gráficos* →
buscar **Active Desktop Name** → arrastrarlo al panel. No requiere reiniciar Plasma.

## Arquitectura

Clean architecture en tres anillos sobre QML:

- `contents/ui/logic/formatName.js` — dominio puro (resolución del nombre, fallback). Testeable sin Qt.
- `contents/ui/DesktopService.qml` — infraestructura: envuelve `TaskManager.VirtualDesktopInfo`, expone `currentName`.
- `contents/ui/DesktopLabel.qml` — presentación pura (data-down): recibe la prop `text`.
- `contents/ui/main.qml` — `PlasmoidItem`, wiring delgado.

Inspiración: React (composición data-down), Vue (reactividad declarativa),
Angular (separación de capas + servicio).

## Desarrollo y pruebas

```bash
node tests/formatName.test.js                 # unit tests de lógica pura
qmllint contents/ui/*.qml contents/config/*.qml
plasmoidviewer -a .                           # preview aislado
```

## Documentación

- Diseño: `docs/plans/2026-06-29-active-desktop-name-design.md`
- Plan: `docs/plans/2026-06-29-active-desktop-name.md`
- Referencia oficial: https://develop.kde.org/docs/plasma/widget/

## Licencia

GPL-3.0
