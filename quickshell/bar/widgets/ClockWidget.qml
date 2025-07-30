import "root:/settings"
import "root:/helpers"
import QtQuick

StyledText {
    id: timeText
    font.pointSize: Config.font.size.normal
    font.family: Config.font.family.mono
    font.weight: 600

    implicitHeight: parent.height

    // backgroundColor: Colors.background
    textColor: Colors.foreground

    text: Datetime.date + " | " + Datetime.time
}
