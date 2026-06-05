import QtQuick
import Quickshell
import Quickshell.Hyprland

PanelWindow {
    id: root

    anchors {
        top: true
        left: true
        right: true
    }

    color: "transparent"
    implicitHeight: 40

    
    // ===== Hintergrund =====
    Rectangle {
        id: statusBar
        anchors.fill: parent
        color: "#00000000"

        // ===== Left Group =====
        Row {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 10
            spacing: 10

            WorkspaceBar {}
            
            MusicBox {}
        }

        // ===== Uhr =====
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

        // Uhr-Update-Logik
        Timer {
            interval: 1000
            repeat: true
            running: true

            onTriggered: {
                clockText.text = Qt.formatTime(new Date(), "hh:mm")
            }
        }

        // ===== Kontrollanzeigen =====
        StatusBar {
            id: rightBox
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 10
        }
    }
}
