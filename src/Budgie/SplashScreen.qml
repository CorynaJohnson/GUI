import QtQuick 2.0

MyTextRect
{
    id: splashScreen
    signal openMainScreen
    anchors.fill: parent
    AnimatedImage
    {
        source: "../../img/budgiedance.gif"
        anchors.fill: parent
    }

    MyButton
    {
        id: back_button_dancingbudgie
        height: 30
        width: 75
        border.color: "black"
        //anchors.horizontalCenter: parent.horizontalCenter
        //anchors.top: text_colorblind.bottom
        anchors.top: parent.top
        anchors.left: parent.left
        //anchors.topMargin: 100
        //anchors.bottomMargin: 100
        mouseArea
        {
            onClicked:
            {
                openMainScreen()
            }
        }

        Text
        {
            id: txt_btn_back
            text: "Back"
            font.family: "Matura MT Script Capitals"
            font.pointSize: 12
            //anchors.bottomMargin: 100
            anchors.horizontalCenter:  parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
