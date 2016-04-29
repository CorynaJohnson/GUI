import QtQuick 2.0


MyTextRect
{
    id: mainScreen
    text: "Budgie - GUI Project"
    font.family: "Tempus Sans ITC"
    anchorText.horizontalCenter: horizontalCenter
    anchorText.top: top
    font_color: color_check ? "blue" : "white"
    font.pixelSize: 35
    color: "transparent"

    property bool color_check: false
    onColor_checkChanged:
    {
        if(color_check)
        {
            button1.color = "white"
            button1.mainScreenButton.color = "black"
            button1.border.color = "black"

            button2.color = "white"
            button2.mainScreenButton.color = "black"
            button2.border.color = "black"

            button3.color = "white"
            button3.mainScreenButton.color = "black"
            button3.border.color = "black"
        }
        else
        {
            button1.color = "#604169E1"
            button1.mainScreenButton.color = "white"
            button1.border.color = "#904169E1"

            button2.color = "#604169E1"
            button2.mainScreenButton.color = "white"
            button2.border.color = "#904169E1"

            button3.color = "#604169E1"
            button3.mainScreenButton.color = "white"
            button3.border.color = "#904169E1"
        }
    }


    signal openSettings



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

            border.width: 5
            width: mainScreen.width/3
            height: mainScreen.height/8
            color: color_check ? "white" : "#604169E1"
            mainScreenButton.color: color_check ? "black" : "white"
            border.color: color_check ? "black" : "#904169E1"

            mouseArea
            {
                onEntered:
                {
                    if(color_check)
                    {
                        color = "black"
                        mainScreenButton.color = "white"
                    }
                    else
                    {
                        color = "#60e6eeff"
                        mainScreenButton.color = "#4169E1"
                    }
                }

                onExited:
                {
                    if(color_check)
                    {
                        color = "white"
                        mainScreenButton.color = "black"
                    }
                    else
                    {
                        color = "#604169E1"
                        mainScreenButton.color = "white"
                    }
                }
            }
        }



        MyButton
        {
            id: button2
            mainScreenButton.text: "Categories"
            mainScreenButton.font.family: "Matura MT Script Capitals"
            mainScreenButton.font.pixelSize: 23

            border.width: 5
            width: mainScreen.width/3
            height: mainScreen.height/8
            color: color_check ? "white" : "#604169E1"
            mainScreenButton.color: color_check ? "black" : "white"
            border.color: color_check ? "black" : "#904169E1"

            mouseArea
            {

                onEntered:
                {
                    if(color_check)
                    {
                        color = "black"
                        mainScreenButton.color = "white"
                    }
                    else
                    {
                        color = "#60e6eeff"
                        mainScreenButton.color = "#4169E1"
                    }
                }

                onExited:
                {
                    if(color_check)
                    {
                        color = "white"
                        mainScreenButton.color = "black"
                    }
                    else
                    {
                        color = "#604169E1"
                        mainScreenButton.color = "white"
                    }
                }

            }
        }


        MyButton
        {
            id: button3
            mainScreenButton.text: "Settings"
            mainScreenButton.font.family: "Matura MT Script Capitals"
            mainScreenButton.font.pixelSize: 23
            border.width: 5

            width: mainScreen.width/3
            height: mainScreen.height/8
            color: color_check ? "white" : "#604169E1"
            mainScreenButton.color: color_check ? "black" : "white"
            border.color: color_check ? "black" : "#904169E1"

            mouseArea
            {
                onEntered:
                {
                    if(color_check)
                    {
                        color = "black"
                        mainScreenButton.color = "white"
                    }
                    else
                    {
                        color = "#60e6eeff"
                        mainScreenButton.color = "#4169E1"
                    }
                }

                onExited:
                {
                    if(color_check)
                    {
                        color = "white"
                        mainScreenButton.color = "black"
                    }
                    else
                    {
                        color = "#604169E1"
                        mainScreenButton.color = "white"
                    }
                }
                onClicked:
                {
                    openSettings()
                }
            }
        }

    }
    signal openDancingBudgie
    MyButton
    {
        id: dancingBudgie
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 15
        border.width: 1
        border.color: "black"
        color: "green"
        width: 70
        height: 30
        Text
        {
            text: "Dance!"
            color: "white"
            font.pixelSize: 20
        }

        mouseArea
        {
            anchors.fill: dancingBudgie
            onEntered:
            {
                color = "red"
            }

            onExited:
            {
                color = "green"
            }
            onClicked:
            {
                openDancingBudgie()
            }
        }
    }

    property alias toggleBackground: backgroundImage.source
    Image
    {
        id: backgroundImage

        source: !color_check ? "../../img/budgiepiccrop.jpg" : "../../img/budgiepic_colorblind.jpg"

        anchors.top: mainTitle.bottom
        anchors.bottom: mainScreen.bottom
        anchors.right: mainScreen.right
        anchors.left: mainScreen.left
        //anchors.fill: mainScreen
        z: -1
    }
}

