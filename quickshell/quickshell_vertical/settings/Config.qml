pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    readonly property Spacing spacing: Spacing {}
    readonly property Padding padding: Padding {}

    readonly property Font font: Font {}

    component Spacing: QtObject {
        readonly property int smaller: 6
        readonly property int small: 8
        readonly property int normal: 10
        readonly property int large: 12
        readonly property int larger: 14
    }

    component Padding: QtObject {
        readonly property int smaller: 5
        readonly property int small: 7
        readonly property int normal: 10
        readonly property int large: 12
        readonly property int larger: 15
    }

    component Font: QtObject {
        readonly property FontFamily family: FontFamily {}
        readonly property FontSize size: FontSize {}
    }

    component FontFamily: QtObject {
        readonly property string mono: "Intone Mono Nerd Font"
    }

    component FontSize: QtObject {
        readonly property int smaller: 8
        readonly property int small: 10
        readonly property int normal: 12
        readonly property int large: 14
        readonly property int larger: 17
    }
}
