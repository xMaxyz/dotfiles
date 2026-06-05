import QtQuick
import Quickshell.Hyprland

Rectangle {
    id: workspacebar

    //Variablen
    property int active: Hyprland.focusedWorkspace?.id ?? 1
    property int horizontalPadding: 24

    //Aussehen der Hintergrund-Box
    height: 40
    radius: 10
    width: rowWorkspaces.width + (workspacebar.horizontalPadding * 2)
    color: "#B3141414"

    //Elemente
    Row {
        id: rowWorkspaces
        anchors.centerIn: parent
        spacing: 30

        Repeater {
            model: Hyprland.workspaces

            delegate: Text {
                //allg. Aussehen
                text: modelData.id
                font.pointSize: 10.5
                opacity: 1.0
                visible: modelData.id > 0
                
                //Textfarbe nach aktivem Workspace
                color: modelData.id === workspacebar.active
                    ? "#faa768"
                    : "#ffffff"

                //Animation
                Behavior on color {
                    ColorAnimation {
                        duration: 300 //in ms
                        easing.type: Easing.OutCubic // Macht den Start schnell und das Ende sanft
                    }
                }
            }
        }
    }
}
