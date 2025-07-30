import "root:/settings"
import "root:/helpers"
import "./widgets"

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

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
                        left: true
                        right: true
                        bottom: false
                    }

                    implicitHeight: 28
                    // implicitWidth: 30

                    color: Colors.background

                    Rectangle {
                        id: barBackground
                        anchors {
                            fill: parent
                        }
                        color: panel.color
                    }

                    RowLayout {
                        anchors.fill: parent
                        spacing: Config.spacing.small

                        PrettyImage {
                            Layout.alignment: Qt.AlignVCenter
                            Layout.leftMargin: 4
                        }

                        Hypr_Workspaces {}

                        Item { Layout.fillWidth: true }

                        Rectangle {
                            implicitWidth: systemTrayModule.width + Config.spacing.normal
                            implicitHeight: systemTrayModule.height + 2

                            // Layout.rightMargin: Config.spacing.extraSmall

                            radius: 8
                            color: Colors.highlight_1

                            Tray {
                                id: systemTrayModule
                                anchors.centerIn: parent
                                // anchors.verticalCenter: parent.verticalCenter

                                shell: rootScope.shell
                                bar: panel
                            }
                        }

                        ClockWidget {
                            Layout.alignment: Qt.AlignVCenter
                            Layout.rightMargin: Config.spacing.smaller
                        }
                    }
                    
                    // RoundedCorner.qml. It needs a bigger bar to work properly
                    // Loader {
                    //     anchors {
                    //         left: parent.left
                    //         right: parent.right
                    //     }
                    //     y: 20
                    //     width: parent.width
                    //     height: 20
                    //
                    //     sourceComponent: Item {
                    //         RoundedCorner {
                    //             anchors.left: parent.left
                    //             corner: RoundedCorner.CornerEnum.TopLeft
                    //             size: 18
                    //             color: Colors.pink
                    //         }
                    //     }
                    // }
                }
            }
        }
    }
}
