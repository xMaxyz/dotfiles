pragma Singleton

import QtQuick

QtObject {
readonly property string wallpaperName: "red-dust"

    //colors
    readonly property color menubarBackground: "#B3141414" //background for components of menubar
    readonly property color widgetBackground: "#25000000"
    readonly property color widgetBorderColor: "#15FFFFFF"
    readonly property color accent: "#faa768"
    readonly property color foreground: "#ffffff" //text color
    readonly property color widgetSubtext: "#D0FFFFFF"

    //fonts
    readonly property string fontFamily: "JetBrainsMono Nerd Font"
    readonly property int normalFontSize: 10

    //box style
    readonly property int borderRadius: 10 //for all components of menubar but MusicPopup
    readonly property int menubarBoxWidth: 70 //Base value for all components of menubar
    readonly property int menubarBoxHeight: 40 //Height for all menubar


    //Widget
    readonly property real widgetzoneWidth: 0.3
}