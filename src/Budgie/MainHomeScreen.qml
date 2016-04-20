import QtQuick 2.0


MyTextRect
{
    id: mainScreen
    text: "Budgie - GUI Project"
    font.family: "Tempus Sans ITC"
    font_color: "blue"
    font.pixelSize: 35
    color: "transparent"

    //anchors.horizontalCenter: parent.horizontalCenter
    //anchors.top: parent.top

    anchorText.horizontalCenter: horizontalCenter
    anchorText.top: top

    Column
    {
        spacing: mainScreen.height/15
        width: mainScreen.width/3
        //height: mainScreen.height
        anchors.horizontalCenter: mainScreen.horizontalCenter
        anchors.centerIn: mainScreen
        anchors.top: mainTitle.bottom

        MyButton
        {
            id: button1
            mainScreenButton.text: "Budget"
            mainScreenButton.font.family: "Matura MT Script Capitals"
            mainScreenButton.font.pixelSize: 23
            mainScreenButton.color: "white"
            width: mainScreen.width/3
            height: mainScreen.height/8
            color: "#604169E1"
            border.width: 5
            border.color: "#904169E1"

            mouseArea
            {
                onEntered:
                {
                    color = "#60e6eeff"
                    mainScreenButton.color = "#4169E1"
                }

                onExited:
                {
                    color = "#604169E1"
                    mainScreenButton.color = "white"
                }
            }
        }

        MyButton
        {
            id: button2
            mainScreenButton.text: "Categories"
            mainScreenButton.font.family: "Matura MT Script Capitals"
            mainScreenButton.font.pixelSize: 23
            mainScreenButton.color: "white"
            width: mainScreen.width/3
            height: mainScreen.height/8
            color: "#604169E1"
            border.width: 5
            border.color: "#904169E1"

            mouseArea
            {
                onEntered:
                {
                    color = "#60e6eeff"
                    mainScreenButton.color = "#4169E1"
                }

                onExited:
                {
                    color = "#604169E1"
                    mainScreenButton.color = "white"
                }
            }
        }

        MyButton
        {
            id: button3
            mainScreenButton.text: "To-Do"
            mainScreenButton.font.family: "Matura MT Script Capitals"
            mainScreenButton.font.pixelSize: 23
            mainScreenButton.color: "white"
            width: mainScreen.width/3
            height: mainScreen.height/8
            color: "#604169E1"
            border.width: 5
            border.color: "#904169E1"

            mouseArea
            {
                onEntered:
                {
                    color = "#60e6eeff"
                    mainScreenButton.color = "#4169E1"
                }

                onExited:
                {
                    color = "#604169E1"
                    mainScreenButton.color = "white"
                }
            }
        }
    }
    Image
    {
        id: backgroundImage
        source: "../../img/budgiepiccrop.jpg"
        anchors.top: mainTitle.bottom
        anchors.bottom: mainScreen.bottom
        anchors.right: mainScreen.right
        anchors.left: mainScreen.left
        //anchors.fill: mainScreen
        z: -1
    }
}
