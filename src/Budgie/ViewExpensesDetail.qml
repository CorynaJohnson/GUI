import QtQuick 2.0


MyTextRect
{
    id: viewExpensesDetail
    text: "Expenses"
    font.family: "AR BERKLEY"
    anchors.fill:parent
    anchorText.horizontalCenter: horizontalCenter
    anchorText.horizontalCenterOffset: 20
    anchorText.top: top
    font_color: "black"
    font.pixelSize: 35
    color: "transparent"

    signal openViewExpenses
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
                clear_expenses()

                openViewExpenses()
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

//    function expenses()
//    {
//        for(var i = 0; i < Budget.numberofExpenses(viewExpensesScreen.return_cat_index()); i++)
//        {
//            cbItems.set(i, {"reason": Budget.getExpenseReason(viewExpensesScreen.return_cat_index(), i)})
//            cbItems.set(i, {"spent": Budget.getExpenseSpent(viewExpensesScreen.return_cat_index(), i)})
//        }
//    }

    function update_expenses()
    {
        for(var i = 0; i < Budget.numberofExpenses(Budget.getCurrentCategory()); i++)
        {
            expenseModel.set(i, {"reason": Budget.getExpenseReason(Budget.getCurrentCategory(), i), "spent": Budget.getExpenseSpent(Budget.getCurrentCategory(), i)})
        }
    }

    function clear_expenses()
    {
        expenseModel.clear()
    }


    Rectangle
    {
        id: expenseTable
        width: 300
        height: 350
        border.width: 1
        anchors.centerIn: parent

        Component.onCompleted:
        {
            //for(var i = 0; i < Budget.numberofExpenses(Budget.getCurrentCategory()); i++)
            for(var i = 0; i < Budget.numberofCategories(); i++)
            {
                expenseModel.append({"reason": Budget.getExpenseReason(Budget.getCurrentCategory(), i), "spent": Budget.getExpenseSpent(Budget.getCurrentCategory(), i)})
            }
        }
        ListModel
        {
            id: expenseModel
        }
        Component
        {
            id: expenseDelegate
            Row
            {
                spacing: 0

                Rectangle
                {
                    height: 20
                    width: expenseTable.width/2
                    border.width: 1
                    Text
                    {
                        text: reason
                        anchors.centerIn: parent
                        font.pixelSize: 20
                    }
                }
                Rectangle
                {
                    width:expenseTable.width/2
                    border.width: 1
                    height:20

                    Text
                    {
                        color:  Budget.getType(index) ? "green" : "red"
                        text: spent
                        anchors.centerIn: parent
                        font.pixelSize: 20
                    }
                }
            }

        }
        ListView
        {
            id: expenseList
            anchors.fill: parent
            model: expenseModel
            delegate: expenseDelegate
        }

        Rectangle
        {
            id: tableHeader
            Text
            {
                text: "       Reason               Spent"
                font.pixelSize: 20
                color: "black"
            }
            color: "white"
            height: 25
            border.color: "black"
            border.width: 2

            width: parent.width
            anchors.bottom: expenseList.top
            //anchors.bottomMargin: 20
            z: 1
        }
    }

    Image
    {
        source: color_check ? "../../img/budgieexpense.jpg" : "../../img/budgieexpense_colorblind.jpg"
        anchors.top: mainTitle.bottom
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        z: -1
    }

}
