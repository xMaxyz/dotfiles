pragma Singleton

import QtQuick

QtObject {
readonly property string wallpaperName: "red-dust"

    //colors
    readonly property color menubarBackground: "#" //background for components of menubar
    readonly property color widgetBackground: "#"
    readonly property color widgetBorderColor: "#"
    readonly property color accent: "#"
    readonly property color foreground: "#" //text color
    readonly property color widgetSubtext: "#"

    //fonts
    readonly property string fontFamily: ""
    readonly property int normalFontSize: 0

    //box style
    readonly property int borderRadius: 0 //for all components of menubar but MusicPopup
    readonly property int menubarBoxWidth: 0 //Base value for all components of menubar
    readonly property int menubarBoxHeight: 0 //Height for all menubar


    //Widget
    readonly property real widgetzoneWidth: 0
}