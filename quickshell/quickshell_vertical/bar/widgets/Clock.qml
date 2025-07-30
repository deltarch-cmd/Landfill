import "root:/settings"
import "root:/helpers"
import QtQuick

StyledText {
    font.pointSize: Config.font.size.normal
    font.family: Config.font.family.mono
    font.weight: 600

    implicitWidth: parent.width

    // backgroundColor: Colors.background
    textColor: Colors.foreground

    text: Datetime.time
}
