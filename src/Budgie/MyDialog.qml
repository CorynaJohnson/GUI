import QtQuick 2.0


Item
{
    property alias mainScreenRect: mainScreenRect
    MyTextRect
    {
        id: mainScreenRect
        text: "Budgie - GUI Project"
        font.family: "Tempus Sans ITC"
        font_color: "blue"
        font.pixelSize: 25
        width: parent.width
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter

    }


    property alias mainScreenButton: mainScreenButton
    MyButton
    {
        id: mainScreenButton
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


}
