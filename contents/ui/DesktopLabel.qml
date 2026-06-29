import QtQuick
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.plasma.components as PlasmaComponents

// Presentación pura (data-down): recibe `text`.
// El ancho del elemento sigue al texto (con tope `maxWidth`); el sobrante se
// recorta con elipsis y `clip` impide pintar fuera de los límites del
// elemento o del panel.
Item {
    id: root

    property string text: ""

    readonly property int hPad: Kirigami.Units.largeSpacing * 2
    readonly property int vPad: Kirigami.Units.smallSpacing * 2
    readonly property int maxWidth: Kirigami.Units.gridUnit * 20

    implicitWidth: Math.min(label.implicitWidth + hPad, maxWidth)
    implicitHeight: label.implicitHeight + vPad

    Layout.fillHeight: true
    Layout.minimumWidth: implicitWidth
    Layout.preferredWidth: implicitWidth
    Layout.maximumWidth: maxWidth

    clip: true

    PlasmaComponents.Label {
        id: label
        anchors.fill: parent
        anchors.leftMargin: root.hPad / 2
        anchors.rightMargin: root.hPad / 2
        text: root.text
        color: Kirigami.Theme.textColor
        font.weight: Font.Medium
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight

        onTextChanged: fade.restart()

        NumberAnimation {
            id: fade
            target: label
            property: "opacity"
            from: 0.0
            to: 1.0
            duration: 150
            easing.type: Easing.OutCubic
        }
    }
}
