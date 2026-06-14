import QtQuick
import Quickshell
import Quickshell.Hyprland
import "../common"

Item {
    anchors.centerIn: parent

    Rectangle {
        anchors.centerIn: parent

        height: Theme.boxHeight
        width: Theme.boxWidth
        radius: Theme.borderRadius
        color: Theme.background

        Text {
            id: clockText
            color: Theme.foreground
            font.pointSize: Theme.normalFontSize
            font.family: Theme.fontFamily
            anchors.centerIn: parent
            text: Qt.formatTime(new Date(), "hh:mm")
        }
    }

    //clock updater
    Timer {
        interval: 1000
        repeat: true
        running: true

        onTriggered: {
            clockText.text = Qt.formatTime(new Date(), "hh:mm")
        }
    }
}