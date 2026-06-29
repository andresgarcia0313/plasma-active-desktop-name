import QtQuick
import org.kde.taskmanager as TaskManager
import "logic/formatName.js" as Fmt

QtObject {
    id: service

    readonly property TaskManager.VirtualDesktopInfo vdi: TaskManager.VirtualDesktopInfo {}

    readonly property string currentName: Fmt.displayName(
        vdi.currentDesktop, vdi.desktopIds, vdi.desktopNames)
}
