import QtQuick

Rectangle {
    id: root

    // Customizable properties
    property alias text: label.text
    property color backgroundColor: "#00000000"
    property color textColor: "#FFFFFF"
    property int rectRadius: 0
    property int padding: 0
    property alias font: label.font

    color: backgroundColor
    radius: root.rectRadius

    implicitWidth: label.implicitWidth + padding * 2
    implicitHeight: label.implicitHeight + padding * 2

    Text {
        id: label
        anchors.centerIn: parent
        color: root.textColor
    }
}
