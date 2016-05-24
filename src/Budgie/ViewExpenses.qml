import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2

MyTextRect
{
    id: viewExpenses
    text: "View Expenses"
    font.family: "AR BERKLEY"
    anchors.fill:parent
    anchorText.horizontalCenter: horizontalCenter
    anchorText.horizontalCenterOffset: 20
    anchorText.top: top
    font_color:  "black"
    font.pixelSize: 35
    color: "transparent"

    signal openMainBudget
    signal openViewExpensesDetail

    property bool color_check: false

    MyButton
    {
        id: back_button_viewExpenses
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
            anchors.horizontalCenter:  parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }


    function update_categories()
    {
        for(var i = 0; i < Budget.numberofCategories(); i++)
        {
            cbItems.set(i, {"name": Budget.getName(i)})
        }
        //Budget.setCurrentCategory(dropDownCategories.category_index)
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
        height: 50
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: comboHeader.bottom
    }



    function return_cat_index()
    {
        return dropDownCategories.category_index
    }

    MyButton
    {
        id: viewExpensesButton
        height: 30
        width: 75
        border.color: "black"
        anchors.top: dropDownCategories.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20

        mouseArea
        {
            onClicked:
            {
                //viewExpensesDetailScreen.update_expenses()
                Budget.setCurrentCategory(dropDownCategories.category_index)
                viewExpensesDetailScreen.update_expenses()
                openViewExpensesDetail()
            }
        }

        Text
        {
            id: txt_btn_accept
            text: "View"
            font.family: "Matura MT Script Capitals"
            font.pointSize: 12
            anchors.centerIn: parent
        }
    }

    Image
    {
        source: "../../img/budgiepicture.jpg"
        //anchors.top: viewExpensesButton.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height/2
        z: -1
    }
}


