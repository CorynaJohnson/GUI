import QtQuick 2.0


Item
{
    property alias dialogTextRect: nameOfProject

    property bool dragToggle: false

    MyTextRect
    {
        id: nameOfProject
        text: "Budgie - GUI Project"
        font.family: "Tempus Sans ITC"
        font_color: "blue"
        font.pixelSize: 25
        width: parent.width
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter

    }

    property alias dialogSecondRect: descriptionOfProject

    MyTextRect
    {
        id: descriptionOfProject
        visible: false
        text: "This project will be a budgeting/to-do list application."
        font.family: "Tempus Sans ITC"
        font_color: "blue"
        font.pixelSize: 25
        width: parent.width
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter

    }


    property alias dialogTextButton: contToSecondScreen
    MyButton
    {
        id: contToSecondScreen
        text: "Click me"
        font.family: "Stencil"
        font_color: "white"
        font.pixelSize: 20
        width: parent.width/2
        height: parent.height/4
        color: "teal"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom

        mouseArea.onClicked:
        {
            nameOfProject.visible = false
            dialogSecondButton.visible = true
            descriptionOfProject.visible = true
            contToSecondScreen.visible = false
        }
    }

    property alias dialogSecondButton: contToFinalScreen

    MyButton
    {
        id: contToFinalScreen
        visible: false
        text: "Click Me Again!"
        font.family: "Stencil"
        font_color: "white"
        font.pixelSize: 20
        width: parent.width/2
        height: parent.height/4
        color: "teal"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom

        mouseArea.onClicked:
        {
            descriptionOfProject.text = "Project By: Coryna Johnson"
            dialogThirdButton.visible = true
        }
    }

    property alias dialogThirdButton: lastScreen

    MyButton
    {
        id: lastScreen
        visible: false
        text: "Next"
        font.family: "Stencil"
        font_color: "white"
        font.pixelSize: 20
        width: parent.width/2
        height: parent.height/4
        color: "teal"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom

        mouseArea.onClicked:
        {
            descriptionOfProject.text = "This will eventually be the home screen"
            dialogThirdButton.color = "Blue"
            dialogThirdButton.text = "Finished!"


        }


    }
//        MouseArea
//        {
//            anchors.fill: parent
//            drag.target:
//            {
//                if(dragToggle)
//                    parent
//                else
//                    undefined
//            }
//        }
}
