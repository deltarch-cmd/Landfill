import "root:/settings"

import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Column {
    id: root
    property var bar
    property var shell
    property var trayMenu

    spacing: Config.spacing.smaller
    Layout.alignment: Qt.AlignHCenter

    property bool containsMouse: true
    property var systemTray: SystemTray

    Repeater {
        model: systemTray.items
        delegate: Item {
            width: 20
            height : 20

            // To hide spotify icon
            visible: modelData && modelData.id !== "spotify"
            // visible: true 
            // property bool isHovered: trayMouseArea.containsMouse

            Rectangle {
                anchors.centerIn: parent
                width: parent.width
                height: parent.height
                radius: 0
                color: "transparent"
                clip: true

                IconImage {
                    id: trayIcon
                    anchors.centerIn: parent
                    width: 16
                    height: 16
                    smooth: false
                    asynchronous: true
                    backer.fillMode: Image.PreserveAspectFit
                    source: {
                        let icon = modelData.icon || "";
                        if (!icon) return "";
                        if (icon.includes("?path=")) {
                            const [name, path] = icon.split("?path=");
                            const fileName = name.substring(name.lastIndexOf("/") + 1);
                            return `file://${path}/${fileName}`;
                        }
                        return icon;
                    }
                    opacity: status === Image.Ready ? 1 : 0
                    Component.onCompleted: {}
                }
            }

            MouseArea {
                id: trayMouseArea
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                
                onClicked: (mouse) => {
                    if (!modelData) return;

                    if (mouse.button === Qt.LeftButton) {
                        if (!modelData.onlyMenu) {
                            modelData.activate()
                        }
                    }
                }

                onPressAndHold: {
                    if (modelData.contextMenu)
                    modelData.contextMenu.open()
                }
            }

            Component.onDestruction: {}
        }
    }
}
