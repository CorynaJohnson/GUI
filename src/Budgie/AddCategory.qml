import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2

MyTextRect
{
    id: addCategory
    text: "Add Category"
    font.family: "AR BERKLEY"
    anchors.fill:parent
    anchorText.horizontalCenter: horizontalCenter
    anchorText.horizontalCenterOffset: 20
    anchorText.top: top
    font_color: "black"
    font.pixelSize: 35
    color: "transparent"

    signal openMainScreen
    signal openAddCategory
    property bool color_check: false


    Text
    {
        id: nameHeader
        text: "Name of Category"
        font.family: "Matura MT Script Capitals"
        font.pointSize: 15
        color: "dark blue"
        anchors.top: parent.top
        anchors.topMargin: 45
        anchors.horizontalCenter: parent.horizontalCenter
    }
    property alias cleartextname: txt_field_name.text
    TextField
    {
        id: txt_field_name
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: nameHeader.bottom
        width: 9*(parent.width)/10
        placeholderText: qsTr("Enter Name...")
    }

    Text
    {
        id: allowanceHeader
        text: "Enter Allowance Amount"
        font.family: "Matura MT Script Capitals"
        font.pointSize: 15
        color: "dark blue"
        anchors.top: txt_field_name.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
    property alias cleartextallowance: txt_field_allowance.text
    TextField
    {
        id: txt_field_allowance
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: allowanceHeader.bottom
        width: 9*(parent.width)/10
        placeholderText: qsTr("Enter Allowance...")

        validator: DoubleValidator{
                    notation: "StandardNotation"
                    decimals: 2
                }

    }

    Text
    {
        id: typeHeader
        text: "Select the Type of Category"
        font.family: "Matura MT Script Capitals"
        font.pointSize: 15
        color: "dark blue"
        anchors.top: txt_field_allowance.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
    ComboBox {
        id: dropDownType
        property alias type_index: dropDownType.currentIndex

        currentIndex: Budget.numofTypes()
        model: ListModel {
            id: cbItems
        }
        Component.onCompleted:
        {
            for(var i = 0; i < Budget.numofTypes(); i++)
            {
                if(i == 0)
                    cbItems.append({"name": "Income"})
                else
                    cbItems.append({"name": "Expense"})
            }
        }
        width: 9*(parent.width)/10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: typeHeader.bottom
    }

    MyButton
    {
        id: back_button_addCategory
        height: 30
        width: 75
        border.color: "black"
        anchors.top: parent.top
        anchors.left: parent.left
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
            anchors.horizontalCenter:  parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    MyButton
    {
        id: addCategoryButton
        height: 30
        width: 75
        border.color: "black"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: dropDownType.bottom
        anchors.topMargin: 20
        anchors.verticalCenterOffset: 20

        mouseArea
        {
            onClicked:
            {
                if(dropDownType.type_index == 0)
                    Budget.insertCategory(txt_field_name.text, txt_field_allowance.text, true)
                else
                    Budget.insertCategory(txt_field_name.text, txt_field_allowance.text, false)
                addExpenseScreen.update_categories()
                viewExpensesScreen.update_categories()
                cleartextallowance = ""
                cleartextname = ""
                openAddCategory()
            }
        }

        Text
        {
            id: txt_btn_accept
            text: "Add"
            font.family: "Matura MT Script Capitals"
            font.pointSize: 12
            anchors.centerIn: parent
        }
    }
    Image
    {
        source: "../../img/budgiecategory.jpg"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height/2
        z: -1
    }
}
