import QtQuick 2.0

Rectangle
{
    property alias mainScreenButton: myButtonText
    Text
    {
        id: myButtonText
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

