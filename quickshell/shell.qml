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

    
    // ===== Background =====
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

        // ===== Clock =====
        ClockBox {}

        // ===== Control Panels =====
        StatusBar {
            id: rightBox
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 10
        }
    }

    //music popup
    MusicPopup {
        id: musicPopup
    }
}
