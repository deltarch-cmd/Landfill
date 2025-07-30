import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets
import Qt5Compat.GraphicalEffects
import "root:/settings"

RowLayout {
    property HyprlandMonitor monitor: Hyprland.monitorFor(screen)

    Rectangle {
        id: workspaceBar
        Layout.preferredWidth: 196
        Layout.preferredHeight: 20
        radius: 8
        color: Colors.highlight_1

        Row {
            anchors.centerIn: parent
            spacing: Config.spacing.large

            Repeater {
                model: 9

                Item {
                    required property int index
                    property bool focused: Hyprland.focusedMonitor?.activeWorkspace?.id === (index + 1)

                    width: workspaceText.width
                    height: workspaceText.height

                    Text {
                        id: workspaceText
                        text: (index + 1).toString()
                        color: Colors.foreground_1 
                        font.pixelSize: 14
                        font.bold: focused
                    }

                    Text {
                        visible: focused
                        color: "white"
                        text: (index + 1).toString()
                        font.pixelSize: 16
                        font.bold: focused
                    }

                    // Rectangle {
                    //     visible: focused
                    //     anchors {
                    //         left: workspaceText.left
                    //         right: workspaceText.right
                    //         top: workspaceText.bottom
                    //         topMargin: -2
                    //     }
                    //     height: 1
                    //     color: "white"
                    // }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        // onClicked: Utils.HyprlandUtils.switchWorkspace(index + 1)
                    }
                }
            }
        }
    }
}
