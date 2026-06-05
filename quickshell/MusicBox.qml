import QtQuick
import Quickshell
import Quickshell.Io

Rectangle {
    id: mediaBox

    property string currentTrack: "-"

    width: Math.max(70, mediaText.implicitWidth + 24)
    height: 40
    radius: 10
    clip: true
    color: "#B3141414"
    //Behavior on width {
    //    NumberAnimation { duration: 100; easing.type: Easing.InOutQuad }
    //}

    Timer {
        id: mediaTimer
        interval: 2000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: playerProcess.running = true
    }

    Process {
        id: playerProcess
        command: ["playerctl", "metadata", "--format", "{{artist}} - {{title}}"]
        running: false

        stdout: StdioCollector {
            onStreamFinished: {
                let track = this.text.trim();

                if (track.length > 0 && track !== "-") {
                    mediaBox.currentTrack = track
                    mediaBox.width = Math.max(70, mediaText.implicitWidth + 24);
                } else {
                    mediaBox.currentTrack = "-";
                    mediaBox.width = 0;
                }
            }
        }
        stderr: StdioCollector {
            onStreamFinished: {
                if (this.text.trim().length > 0) {
                    mediaBox.currentTrack = "-";
                }
            }
        }
    }

    Text {
        id: mediaText
        anchors.centerIn: parent
        font.pointSize: 10
        font.family: "JetBrainsMono Nerd Font"
        color: "#ffffff"
        text: mediaBox.currentTrack
    }
}
