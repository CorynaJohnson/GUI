import QtQuick 2.0

Rectangle
{
    id: mainRect
    property alias text: rect_text.text
    property alias font: rect_text.font
    property alias font_color: rect_text.color
    property alias style: rect_text.style
    property alias styleColor: rect_text.styleColor
    property alias anchorText: rect_text.anchors    
    property alias mainTitle: rect_text
    property alias backgroundText: mainRect.color
    Text
    {
        id: rect_text
        font.family: "AR BERKLEY"

        //color: "grey"
        //anchors.centerIn: parent
    }


}
