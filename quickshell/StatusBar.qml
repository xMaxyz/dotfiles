import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Services.UPower
import Quickshell.Io
import Quickshell.Networking

Row {
    id: root
    spacing: 10

    //Volume
    Rectangle {
        id: volumeBox

        PwObjectTracker { //Tracker for audio
            objects: [Pipewire.defaultAudioSink]
        }

        //check if there's a sink
        property bool hasAudio: Pipewire.defaultAudioSink && Pipewire.defaultAudioSink.audio
        //get raw volume
        property real volumeRaw: hasAudio ? Pipewire.defaultAudioSink.audio.volume : 0.0
        //calculate real volume
        property int volumePercent: Math.round(volumeRaw * 100)

        Component.onCompleted: { //Debug
        console.log("=== VolumeBox Geladen ===")
        console.log("Pipewire Objekt vorhanden:", Pipewire ? "Ja" : "Nein")
        console.log("Audio Sink vorhanden:", Pipewire.defaultAudioSink ? "Ja" : "Nein")
        }


        width: 70
        height: 40
        radius: 10
        color: "#B3141414"

        Text {
            anchors.centerIn: parent
            font.pointSize: 10.5
            color: "#ffffff"
            text: volumeBox.hasAudio ? "V:  " + volumeBox.volumePercent + "%" : "V: -"
        }
    }

    //Battery
    Rectangle {
        id: batteryBox

        //Tracker for battery
        PwObjectTracker {
            objects: [UPower.displayDevice]
        }

        //check for battery
        readonly property bool hasBattery: UPower.displayDevice !== null
        //calculate percentage
        readonly property int batteryPercent: hasBattery ? Math.round(UPower.displayDevice.percentage * 100) : 0

        width: 70
        height: 40
        radius: 10
        color: "#B3141414"

        Text {
            anchors.centerIn: parent
            font.pointSize: 10.5
            color: "#ffffff"
            text: batteryBox.hasBattery ? "B:  " + batteryBox.batteryPercent + "%" : "B:  -"
        }
    }

    //Memory
    Rectangle {
        id: memoryBox

        property string ramUsage: "0.0 GB"

        width: 90
        height: 40
        radius: 10
        color: '#b3141414'

        //Timer for triggering command
        Timer {
            id: ramTimer
            interval: 5000
            running: true
            repeat: true
            triggeredOnStart: true
            onTriggered: ramProcess.running = true
        }

        //Get RAM usage
        Process {
            id: ramProcess
            command: ["free", "-m"] //command to get ram
            running: false

            stdout: StdioCollector {
                onStreamFinished: {
                    let output = this.text;
                    let lines = output.split("\n");

                    if (lines.length > 1) {
                        let memLine = lines[1].replace(/\s+/g, ' ').trim().split(' ');
                        let usedMB = parseInt(memLine[2]);

                        if (!isNaN(usedMB)) {
                            let usedGB = (usedMB / 1024).toFixed(1);
                            memoryBox.ramUsage = usedGB + " GiB";
                        }
                    }
                }
            }
        }

        Text {
            anchors.centerIn: parent
            font.pointSize: 10.5
            color: "#ffffff"
            text: "M:  " + memoryBox.ramUsage
        }
    }

    //Wifi
    Rectangle {
        id: wifiBox

        property string wifiName: "-"

        width: Math.max(70, wifiText.implicitWidth + 20)
        height: 40
        radius: 10
        color: "#B3141414"
        Behavior on width {
            NumberAnimation { duration: 300; easing.type: Easing.InOutQuad }
        }

        Timer {
            id: wifiTimer
            interval: 5000
            running: true
            repeat: true
            triggeredOnStart: true
            onTriggered: wifiProcess.running = true
        }

        Process {
            id: wifiProcess
            command: ["iwgetid", "-r"]
            running: false

            stdout: StdioCollector {
                onStreamFinished: {
                    let name = this.text.trim();

                    if (name.length > 0) {
                        wifiBox.wifiName = name;
                    } else {
                        wifiBox.wifiName = "-";
                    }
                }
            }
        }
        Text {
            id: wifiText
            anchors.centerIn: parent
            font.pointSize: 10.5
            color: "#ffffff"
            text: "W:  " + wifiBox.wifiName
        }
    }
} 