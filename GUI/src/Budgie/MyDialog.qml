import QtQuick 2.0


Item
{
    property alias dialogTextRect: nameOfProject.text
    property alias dialogColorRect: nameOfProject.font_color
    property alias dialogFontRect: nameOfProject.font
    property alias dialogFontSizeRect: nameOfProject.font.pixelSize
    property alias dialogWidthRect: nameOfProject.width
    property alias dialogHeightRect: nameOfProject.height

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

    property alias dialogTextButton: contToMainScreen.text
    property alias dialogColorButton: contToMainScreen.font_color
    property alias dialogFontButton: contToMainScreen.font
    property alias dialogFontSizeButton: contToMainScreen.font.pixelSize
    //property alias dialogMouseArea: mousearea

    MyButton
    {
        id: contToMainScreen
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
            parent.color = "green"
            parent.font = "I FUCKING HATE GUI"
        }

        mouseArea.onEntered:
        {
          color = "blue"
        }
        mouseArea.onExited:
        {
            color = "red"
        }

    }

    MouseArea
    {
        anchors.fill: parent
        drag.target:
        {
            if(dragToggle)
                parent
            else
                undefined
        }
    }
}
