import "root:/settings"
import "./widgets"

import QtQuick
import QtQuick.Layouts
import Quickshell

Scope {
    id: rootScope
    property var shell

    Item {
        id: barRootItem
        anchors.fill: parent

        Variants {
            model: Quickshell.screens
            Item {
                property var modelData
                PanelWindow {
                    id: panel
                    screen: modelData

                    anchors {
                        top: true
                        bottom: true
                        right: false
                        left: true
                    }
                    // implicitHeight: 28
                    implicitWidth: 28

                    color: Colors.background

                    ColumnLayout {
                        anchors.fill: parent
                        // anchors.horizontalCenter: parent.horizontalCenter

                        spacing: Config.spacing.small

                        PrettyImage {
                            Layout.alignment: Qt.AlignHCenter
                            Layout.topMargin: 4
                        }

                        Item { Layout.fillHeight: true }

                        Tray {
                            id: systemTrayModule
                            shell: rootScope.shell
                            // anchors.verticalCenter: parent.verticalCenter
                            bar: panel
                        }

                        Clock {
                            Layout.alignment: Qt.AlignHCenter
                            Layout.bottomMargin: Config.spacing.smaller
                        }
                    }
                }
            }
        }
    }
}
