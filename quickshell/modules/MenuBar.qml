import QtQuick
import Quickshell
import "../menubar" as MenuBar

PanelWindow {
    id: statusbarRoot

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

            MenuBar.WorkspaceBar {}
            
            MenuBar.MusicBox {}
        }

        // ===== Clock =====
        MenuBar.ClockBox {}

        // ===== Control Panels =====
        MenuBar.StatusBar {
            id: rightBox
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 10
        }
    }

    //music popup
    MenuBar.MusicPopup {
        id: musicPopup
    }
}
