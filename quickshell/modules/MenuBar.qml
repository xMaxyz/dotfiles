import QtQuick
import Quickshell
import "../menubar" as MenuBar
import "../common"

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }

    color: "transparent"
    implicitHeight: Theme.menubarBoxHeight

    
    // ===== Background =====
    Rectangle {
        anchors.fill: parent
        color: "#00000000"

        // ===== Left Group =====
        Row {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 10
            spacing: 10

            Item {
                id: checkForHyprland
                height: workspacebarLoader.height
                width: workspacebarLoader.width

                property bool isHyprland: Quickshell.env("XDG_CURRENT_DESKTOP") === "Hyprland"
                Component.onCompleted: {
                    console.log("=== QUICKSHELL DEBUG ===")
                    console.log("XDG_CURRENT_DESKTOP:", Quickshell.env("XDG_CURRENT_DESKTOP"))
                    console.log("Shell Root Pfad:", Quickshell.shellDir)
                    console.log("Ziel-Pfad existiert?", Quickshell.shellDir + "/menubar/WorkspaceBar.qml")
                }  
                Loader {
                    id: workspacebarLoader
                    active: checkForHyprland.isHyprland
                    source: Qt.resolvedUrl(Quickshell.shellDir + "/menubar/WorkspaceBar.qml")
                    width: item ? item.implicitWidth : 0
                    height: item ? item.height : 0

                    onStatusChanged: {
        if (status === Loader.Error) {
            console.log("=== LOADER FEHLER ===");
            console.log("Grund:", progress, errorString());
        } else if (status === Loader.Ready) {
            console.log("=== LOADER ERFOLG ===");
            console.log("Geladenes Item:", item);
            console.log("Größe der Bar:", item.width, "x", item.height);
        }
    }
                }
            }          
            MenuBar.MusicBox {}
        }

        // ===== Clock =====
        MenuBar.ClockBox {}

        // ===== Right Group =====
        MenuBar.StatusBar {
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
