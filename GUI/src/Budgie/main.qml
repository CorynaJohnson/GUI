import QtQuick 2.6
import QtQuick.Controls 1.5
//Name: Coryna Johnson
//Lab: Lab_2
//Project Name: Budgie

ApplicationWindow
{
    visible: true
    width: 640
    height: 480
    title: qsTr("Budgie")


    MyDialog
    {
        //Rect stuff
        id: splashScreen
        dialogTextRect: "Dialog Nonsense"
        dialogFontSizeRect: 50
        dialogWidthRect: parent.width
        dialogHeightRect: parent.height/10
        //anchors.top: parent.top

        width: parent.width/2
        height: parent.height/2
        x: (parent.width/2)-(width/2)
        y: (parent.height/2)-(height/2)

        //Button stuff
        dialogTextButton: "Click Me!"
        //dialogColorButton: "blue"



        //set to true for draging to be enabled :]
        dragToggle: false
    }

}
