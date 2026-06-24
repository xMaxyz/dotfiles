// ./desktop/widgets/FileGrid.qml
import QtQuick
import QtQuick.Layouts
import Qt.labs.folderlistmodel
import Quickshell
import Quickshell.Io
import "../../common"

Item {
    id: fileGridRoot
    Layout.fillWidth: true
    Layout.fillHeight: true

    FolderListModel {
        id: folderModel
        folder: "file://" + Quickshell.env("HOME") + "/Desktop"
        showFiles: true
        showDirs: true
        showDotAndDotDot: false
    }

    GridView {
        anchors.fill: parent
        model: folderModel
        cellWidth: 90
        cellHeight: 100
        clip: true

        delegate: Item {
            width: 80
            height: 90

            // Nutzt jetzt sichere Unicode-Escapes anstelle von rohen Symbolen
            function getFileIcon(name, isDirectory) {
                if (isDirectory) return "\uf115" // Ordner (folder-open)
                
                var ext = name.split('.').pop().toLowerCase();
                
                switch(ext) {
                    case 'png':
                    case 'jpg':
                    case 'jpeg':
                    case 'webp': return "\uf03e" // Bild (image)
                    case 'mp3':
                    case 'flac':
                    case 'wav':  return "\uf001" // Musik (music)
                    case 'mp4':
                    case 'mkv':  return "\uf008" // Video (film)
                    case 'pdf':  return "\uf1c1" // PDF (file-pdf)
                    case 'zip':
                    case 'tar':
                    case 'gz':   return "\uf1c6" // Archiv (file-archive)
                    case 'sh':
                    case 'bash': return "\uf489" // Terminal/Skript
                    case 'qml':  return "\uf121" // Code (code)
                    default:     return "\uf15b" // Standard Datei (file)
                }
            }

            Rectangle {
                anchors.fill: parent
                color: mouseArea.containsMouse ? Theme.widgetBackground : "transparent"
                radius: 5
                border.color: mouseArea.containsMouse ? Theme.widgetBorderColor : "transparent"
                border.width: 1
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 5
                spacing: 4

                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: getFileIcon(fileName, isDir)
                    font.pointSize: 28
                    // Erzwingt die korrekte Font-Familie
                    font.family: Theme.fontFamily 
                    color: Theme.accent
                }

                Text {
                    Layout.fillWidth: true
                    text: fileName
                    color: Theme.foreground
                    font.pointSize: 9
                    font.family: Theme.fontFamily
                    horizontalAlignment: Text.AlignHCenter
                    elide: Text.ElideRight
                    wrapMode: Text.WordWrap
                    maximumLineCount: 2
                }
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true

                onDoubleClicked: {
                    Process.run(["yazi", filePath])
                }
            }
        }
    }
}
