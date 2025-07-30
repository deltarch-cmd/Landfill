pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import QtQuick

Singleton {
    property string time: Qt.locale().toString(clock.date, "hh\nmm")
    property string date: Qt.locale().toString(clock.date, "dddd, dd/MM")

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
