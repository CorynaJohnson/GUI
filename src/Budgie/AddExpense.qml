import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2

MyTextRect
{
    id: addExpense

    text: "Add Transaction"
    font.family: "AR BERKLEY"
    anchors.fill:parent
    anchorText.horizontalCenter: horizontalCenter
    anchorText.horizontalCenterOffset: 20
    anchorText.top: top
    font_color: "black"
    font.pixelSize: 35
    color: "transparent"

    signal openMainBudget
    signal openAddExpense

    property bool color_check: false

    MyButton
    {
        id: back_button_expense
        height: 30
        width: 75
        border.color: "black"
        anchors.top: parent.top
        anchors.left: parent.left

        mouseArea
        {
            onClicked:
            {
                openMainBudget()
            }
        }

        Text
        {
            id: txt_btn_back
            text: "Back"
            font.family: "Matura MT Script Capitals"
            font.pointSize: 12
            anchors.centerIn: parent
        }
    }


    Text
    {
        id: comboHeader
        text: "Select Your Category"
        font.family: "Matura MT Script Capitals"
        font.pointSize: 15
        color: "dark blue"
        anchors.top: parent.top
        anchors.topMargin: 45
        anchors.horizontalCenter: parent.horizontalCenter
    }

    function update_categories()
    {
        for(var i = 0; i < Budget.numberofCategories(); i++)
        {
            cbItems.set(i, {"name": Budget.getName(i)})
        }
    }

    ComboBox {
        id: dropDownCategories
        property alias category_index: dropDownCategories.currentIndex

        currentIndex: Budget.numberofCategories()
        model: ListModel {
            id: cbItems
        }
        Component.onCompleted:
        {
            for(var i = 0; i < Budget.numberofCategories(); i++)
            {
                cbItems.append({"name": Budget.getName(i)})
            }

        }
        width: 9*(parent.width)/10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: comboHeader.bottom
    }

    Text
    {
        id: spentHeader
        text: "How much did you spend/receive?"
        font.family: "Matura MT Script Capitals"
        font.pointSize: 15
        color: "dark blue"
        anchors.top: dropDownCategories.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
    property alias cleartextspent: txt_field_spent.text
    TextField
    {
        id: txt_field_spent
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: spentHeader.bottom
        width: 9*(parent.width)/10
        placeholderText: qsTr("Enter Amount Spent...")

        validator: DoubleValidator{
                    notation: "StandardNotation"
                    decimals: 2
                }

    }
    Text
    {
        id: reasonHeader
        text: "What was the reason?"
        font.family: "Matura MT Script Capitals"
        font.pointSize: 15
        color: "dark blue"
        anchors.top: txt_field_spent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
    property alias cleartextreason: txt_field_reason.text
    TextField
    {
        id: txt_field_reason
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: reasonHeader.bottom
        height: 50
        width: 9*(parent.width)/10
        placeholderText: qsTr("Enter Reason...")

    }

    MyButton
    {
        id: addExpenseButton
        height: 30
        width: 75
        border.color: "black"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 20

        mouseArea
        {
            onClicked:
            {
                Budget.addExpense(dropDownCategories.category_index, txt_field_spent.text, txt_field_reason.text)
                Budget.subtractFromTotal(dropDownCategories.category_index, txt_field_spent.text)
                mainBudgetScreen.update_table()
                viewExpensesScreen.update_categories()
                //viewExpensesDetailScreen.update_categories()
                viewExpensesDetailScreen.update_expenses()
                cleartextreason = ""
                cleartextspent = ""
                openAddExpense()
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
        height: parent.height/2
        source: "../../img/budiepix.jpg"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        z: -1
    }
}

