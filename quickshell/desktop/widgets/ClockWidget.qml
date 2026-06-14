import QtQuick
import QtQuick.Layouts
import "../../common"

Rectangle {
    id: clockWidget
    
    // Passt sich automatisch der Breite der Widget-Zone an
    Layout.fillWidth: true
    Layout.preferredHeight: 140
    
    // Moderner, semitransparenter Hintergrund (Glaseffekt)
    color: Theme.widgetBackground // Sehr dunkles, 15% transparentes Schwarz
    radius: Theme.borderRadius
    border.color: Theme.widgetBorderColor // Subtiler, helltransparenten Rand
    border.width: 1

    // Interner Timer, der jede Sekunde die Zeit aktualisiert
    Timer {
        id: clockTimer
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            var currentDate = new Date();
            timeText.text = Qt.formatTime(currentDate, "hh:mm:ss");
            dateText.text = Qt.formatDate(currentDate, "dddd, d. MMMM yyyy");
        }
    }

    // Anordnung von Uhrzeit und Datum übereinander
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 5

        // Große Uhrzeit
        Text {
            id: timeText
            Layout.alignment: Qt.AlignHCenter
            color: Theme.foreground
            font.pointSize: 34
            font.weight: Font.Bold
            font.family: Theme.fontFamily
            renderType: Text.NativeRendering
        }

        // Ausgeschriebenes Datum darunter
        Text {
            id: dateText
            Layout.alignment: Qt.AlignHCenter
            color: Theme.widgetSubtext // Leicht transparentes Weiß für bessere Hierarchie
            font.pointSize: 13
            font.weight: Font.Normal
            font.family: Theme.fontFamily
            renderType: Text.NativeRendering
        }
    }
}
