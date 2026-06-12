import QtQuick
import Quickshell
import Quickshell.Hyprland

Item {
    anchors.centerIn: parent

    Rectangle {
        id: centreBox
        anchors.centerIn: parent

        height: 40
        width: 60
        radius: 10
        color: "#B3141414"

        Text {
            id: clockText
            color: "#ffffff"
            font.pointSize: 10
            font.family: "JetBrainsMono Nerd Font"
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