import QtQuick
import org.kde.plasma.plasmoid

PlasmoidItem {
    id: root

    DesktopService { id: service }

    // En el panel se muestra el fullRepresentation inline: respeta el ancho
    // implícito y las propiedades Layout.* del elemento, a diferencia del
    // compactRepresentation, que esta versión de Plasma fuerza a tamaño icono.
    preferredRepresentation: fullRepresentation

    fullRepresentation: DesktopLabel {
        text: service.currentName
    }
}
