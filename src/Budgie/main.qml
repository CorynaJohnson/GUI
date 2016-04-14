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
        dialogTextRect.font.pixelSize: 50
        dialogTextRect.width: parent.width
        dialogTextRect.height: parent.height/10

        //second rect stuff
        dialogSecondRect.font.pixelSize: 25
        dialogSecondRect.width: parent.width
        dialogSecondRect.height: parent.height/10

        width: parent.width/2
        height: parent.height/2
        x: (parent.width/2)-(width/2)
        y: (parent.height/2)-(height/2)

        //Button stuff
        dialogTextButton.text: "Click Me!"
        dialogTextButton.color: "green"

        dialogSecondButton.color: "orange"

        dialogThirdButton.color: "red"



        //set to true for draging to be enabled :]
        //dragToggle: true
    }

}
