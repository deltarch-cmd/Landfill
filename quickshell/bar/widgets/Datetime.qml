pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import QtQuick

Singleton {
    property string time: Qt.locale("en_GB").toString(clock.date, "H:mm a t")
    property string date: Qt.locale("en_GB").toString(clock.date, "ddd, dd/MM")

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
