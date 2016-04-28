import QtQuick 2.6
import QtQuick.Controls 1.5
import Qt.labs.settings 1.0
import QtMultimedia 5.6
import QtQuick.Controls.Styles 1.4



//stuff for lecture 4.18.16
MyTextRect
{
    id: settings_wrapper
    anchors.fill:parent
    anchorText.horizontalCenter: horizontalCenter
    anchorText.top: top
    text: "Settings"
    font.family: "Tempus Sans ITC"
    font.pixelSize: 40

    color: "transparent"

    signal openMainScreen

    property alias color_setting: sw_colorblind.checked
    Settings
    {
        id: settings_global

        property alias colors: sw_colorblind.checked
        //property alias hss: video_dog.muted
        //property alias water_bottle: rect_big_wrapper.color
    }

    Text
    {
        id: text_colorblind
        text: sw_colorblind.checked ? "Color blind on" : "Color blind off"
        font.family: "Matura MT Script Capitals"
        font.pointSize: 20

        anchors.left: parent.left
        anchors.leftMargin: 15
        anchors.top: parent.top
        anchors.topMargin: 50

        //anchors.left: txt_settings.left
        //anchors.right: sw_sound.left
        //anchors.top: txt_settings.bottom
        //anchors.topMargin: 30
    }

    Switch
    {
        id: sw_colorblind
        //z: 5

        anchors.right: settings_wrapper.right
        anchors.rightMargin: 30
        anchors.top: parent.top
        anchors.topMargin: 55


        style: SwitchStyle {
            groove: Rectangle {
                implicitWidth: 100
                implicitHeight: 20
                border.color: "black"
                border.width: 1
            }
        }

        checked:true
    }

    MyButton
    {
        id: back_button_colorblind
        height: 30
        width: 75
        border.color: "black"
        //anchors.horizontalCenter: parent.horizontalCenter
        //anchors.top: text_colorblind.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
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
            font.family: "BELLABOO"
            font.pointSize: 12
            //anchors.bottomMargin: 100
            anchors.horizontalCenter:  parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    Image
    {
        z: -1
        source: "../../img/budgiesetting2.jpg"
        anchors.fill: parent

    }

}


