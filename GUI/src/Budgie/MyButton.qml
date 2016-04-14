import QtQuick 2.0

Rectangle
{
    property alias text: button_text.text
    property alias font: button_text.font
    property alias font_color: button_text.color
    Text
    {
        id: button_text
        anchors.centerIn: parent
    }

    property alias mouseArea: mouseArea
    MouseArea
    {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true

    }


}

