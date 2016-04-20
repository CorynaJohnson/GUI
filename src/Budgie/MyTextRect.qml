import QtQuick 2.0

Rectangle
{
    property alias text: rect_text.text
    property alias font: rect_text.font
    property alias font_color: rect_text.color

    property alias anchorText: rect_text.anchors

    property alias mainTitle: rect_text
    Text
    {
        id: rect_text

        //anchors.centerIn: parent
    }


}
