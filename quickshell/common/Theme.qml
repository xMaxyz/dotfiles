pragma Singleton

import QtQuick

QtObject {

    //colors
    readonly property color background: "#B3141414" //background for components of menubar
    readonly property color accent: "#faa768"
    readonly property color foreground: "#ffffff" //text color

    //fonts
    readonly property string fontFamily: "JetBrainsMono Nerd Font"
    readonly property int normalFontSize: 10

    //box style
    readonly property int borderRadius: 10 //for all components of menubar but MusicPopup
    readonly property int boxWidth: 70 //Base value for all components of menubar
    readonly property int boxHeight: 40 //Height for all menubar
}