import QtQuick 2.0
import Qt.labs.settings 1.0

MyTextRect
{
    id: mainBudgetScreen

    text: "Budget"
    font.family: "AR BERKLEY"
    anchors.fill:parent
    anchorText.horizontalCenter: horizontalCenter
    anchorText.top: top
    font_color: "black"
    font.pixelSize: 40
    color: "transparent"

    signal openMainScreen
    signal openAddExpense
    signal openViewExpense

    property bool color_check: false

    Settings
    {
        id: budget_save
    }

    MyButton
    {
        id: back_button_mainBudget
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
            //anchors.bottomMargin: 100
            anchors.horizontalCenter:  parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    MyButton
    {
        id: button_AddExpense
        height: 30
        width: 120
        border.color: "black"
        anchors.top: totalRow.bottom
        anchors.left: button_viewExpenses.right
        anchors.leftMargin: 10

        mouseArea
        {
            onClicked:
            {
                openAddExpense()
            }
        }

        Text
        {
            id: txt_addExpense
            text: "Add Expense"
            font.family: "Matura MT Script Capitals"
            font.pointSize: 12
            anchors.horizontalCenter:  parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    MyButton
    {
        id: button_viewExpenses
        height: 30
        width: 120
        border.color: "black"
        anchors.top: totalRow.bottom
        anchors.left: parent.left
        anchors.leftMargin: parent.width/7

        mouseArea
        {
            onClicked:
            {
                openViewExpense()
            }
        }

        Text
        {
            id: txt_viewExpenses
            text: "View Expenses"
            font.family: "Matura MT Script Capitals"
            font.pointSize: 12
            anchors.horizontalCenter:  parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    function create_table()
    {
        for(var count = 0; count < Budget.numberofCategories(); count++)
        {
            budgetModel.append({"name": Budget.getName(count), "spent":Budget.getTotalSpent(count), "remaining":Budget.getAllowance(count)})
        }
    }

    function update_table()
    {
        for(var count = 0; count < Budget.numberofCategories(); count++)
        {
            budgetModel.set(count, {"name": Budget.getName(count), "spent":Budget.getTotalSpent(count), "remaining":Budget.getAllowance(count)})
        }
        totalBud = Budget.getBudgetTotal()
        leftBud = Budget.getExpensesLeft()
    }


    function getTotal()
    {
        var total = Budget.getBudgetTotal()
    }

    Rectangle
    {
        id: budgetTable
        width: 300
        height: 350
        border.width: 1
        anchors.centerIn: parent

        Component.onCompleted:
        {
//            for(var count = 0; count < Budget.numberofCategories(); count++)
//            {
//                budgetModel.append({"name": Budget.getName(count), "spent":Budget.getTotalSpent(count), "remaining":Budget.getAllowance(count)})
//            }

            create_table();

        }
        ListModel
        {
            id: budgetModel
        }
        Component
        {
            id: budgetDelegate
            Row
            {
                spacing: 0
                Rectangle
                {
                    height: 35
                    width: budgetTable.width/3
                    border.width: 1
                    Text
                    {
                        id: txt_name
                        text: name
                        //text: Budget.getName()
                        anchors.centerIn: parent
                        font.pixelSize: 14
                    }
                }
                Rectangle
                {
                    height: 35
                    width: budgetTable.width/3
                    border.width: 1
                    Text
                    {
                        text: spent
                        anchors.centerIn: parent
                        font.pixelSize: 14
                    }
                }
                Rectangle
                {
                    width:budgetTable.width/3
                    border.width: 1
                    height:35

                    Text
                    {
                        color:  Budget.getType(index) ? "green" : "red"
                        text: remaining
                        anchors.centerIn: parent
                        font.pixelSize: 14
                    }
                }
            }
        }

        ListView
        {
            id: budgetList
            anchors.fill: parent
            model: budgetModel
            delegate: budgetDelegate
        }

        Rectangle
        {
            id: tableHeader
            Text
            {
                text: " Category   Spent   Allowance"
                font.pixelSize: 20
                color: "black"
                font.bold: true
            }
            color: "white"
            height: 25
            border.color: "black"
            border.width: 2

            width: parent.width
            anchors.bottom: budgetList.top
            //anchors.bottomMargin: 20
            z: 1
        }
    }

    property alias totalBud: totalValue.text
    Rectangle
    {
        id: totalRow
        Text
        {
            id: txtRow
            text: "Total Left: "
            font.pixelSize: 20
            anchors.left: parent.left
            anchors.leftMargin: 5
            font.bold: true
        }

        Text
        {
            id: totalValue
            text: totalBud
            color:
            {
                if(totalBud < 0)
                    "red"
                else
                {
                    totalBud = "None"
                    "green"
                }
            }

            font.pixelSize: 20
            anchors.right: parent.right
            anchors.rightMargin: 5
            font.bold: true
        }

        color: "white"
        height: 25
        border.color: "black"
        border.width: 2

        width: budgetTable.width
        anchors.top: budgetTable.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        //anchors.bottomMargin: 20
        z: 1
    }

    property alias leftBud: leftValue.text
    Rectangle
    {
        id: totalExpensesLeft
        Text
        {
            id: leftRow
            text: "Total Allowance Left: "
            font.pixelSize: 20
            anchors.left: parent.left
            anchors.leftMargin: 5

        }

        Text
        {
            id: leftValue
            text: leftBud
            color:
            {
                if(leftBud < 0)
                {
                    leftBud = leftBud*-1
                    "red"
                }
                else
                {
                    leftBud = "None"
                    "green"
                }
            }

            font.pixelSize: 20
            anchors.right: parent.right
            anchors.rightMargin: 5

        }

        color: "white"
        height: 25
        border.color: "black"
        border.width: 2

        width: budgetTable.width
        anchors.bottom: totalRow.top
        anchors.horizontalCenter: parent.horizontalCenter
        //anchors.bottomMargin: 20
        z: 1
    }

    Image
    {
        z: -1
        source: color_check ? "../../img/budgieexpense.jpg" : "../../img/budgieexpense_colorblind.jpg"
        anchors.top: mainTitle.bottom
        anchors.bottom: mainBudgetScreen.bottom
        anchors.right: mainBudgetScreen.right
        anchors.left: mainBudgetScreen.left
    }

}
