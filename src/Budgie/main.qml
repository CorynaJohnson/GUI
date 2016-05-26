import QtQuick 2.6
import QtQuick.Controls 1.5
import Qt.labs.settings 1.0
import QtMultimedia 5.6
//Name: Coryna Johnson
//Lab: Lab_2
//Project Name: Budgie

ApplicationWindow
{
    visible: true
    width: 350
    height: 500
    title: qsTr("Budgie")

    MainHomeScreen
    {
        id: homeScreen
        anchors.fill: parent
        visible: false

        font_color: !settingsScreen.color_setting ? "dark blue" : "black"
        color_check: settingsScreen.color_setting
        //toggleBackground: settingsScreen.color_setting
        color: settingsScreen.color_setting ? "transparent" : "transparent"

        onOpenMainBudget:
        {
            homeScreen.visible = false
            mainBudgetScreen.visible = true
        }

        onOpenSettings:
        {
            homeScreen.visible = false
            settingsScreen.visible = true
        }
        onOpenDancingBudgie:
        {
            budgieDance.visible = true
            homeScreen.visible = false
        }
        onOpenAddCategory:
        {
            homeScreen.visible= false
            addCategoryScreen.visible = true
        }
    }

    SettingsScreen
    {
        id: settingsScreen
        //anchors.fill: parent
        visible: false
        color_check: settingsScreen.color_setting
        onOpenMainScreen:
        {
            homeScreen.visible = true
            settingsScreen.visible = false
        }

    }

    SplashScreen
    {
        id: budgieDance
        //visible: false
        anchors.fill: parent

        onOpenMainScreen:
        {
            homeScreen.visible = true
            budgieDance.visible = false
        }

    }

    BudgetScreenMain
    {
        id: mainBudgetScreen
        visible: false
        color_check: !settingsScreen.color_setting


        onOpenMainScreen:
        {
            homeScreen.visible = true
            mainBudgetScreen.visible = false
        }
        onOpenAddExpense:
        {
            addExpenseScreen.visible = true
            mainBudgetScreen.visible = false
        }
        onOpenViewExpense:
        {
            viewExpensesScreen.visible = true
            mainBudgetScreen.visible = false
        }
    }

    AddExpense
    {
        id: addExpenseScreen
        visible: false

        onOpenMainBudget:
        {
            mainBudgetScreen.visible = true
            addExpenseScreen.visible = false
        }
    }

    AddCategory
    {
        id: addCategoryScreen
        visible: false

        onOpenMainScreen:
        {
            homeScreen.visible = true
            addCategoryScreen.visible = false
        }
    }

    ViewExpenses
    {
        id: viewExpensesScreen
        visible: false

        onOpenMainBudget:
        {
            mainBudgetScreen.visible = true
            viewExpensesScreen.visible = false
        }

        onOpenViewExpensesDetail:
        {
            viewExpensesScreen.visible = false
            viewExpensesDetailScreen.visible = true
        }
    }

    ViewExpensesDetail
    {
        id: viewExpensesDetailScreen
        visible: false

        color_check: !settingsScreen.color_setting

        onOpenViewExpenses:
        {
            viewExpensesDetailScreen.visible = false
            viewExpensesScreen.visible = true
        }
    }

    //    MyDialog
    //    {



    //        //Rect stuff
    //        mainScreenRect.font.pixelSize: 50
    //        mainScreenRect.width: parent.width
    //        mainScreenRect.height: parent.height/10

    //        //Button stuff
    //        mainScreenButton.text: "Click Me!"
    //        mainScreenButton.color: "green"


    //    }


//    stuff for lecture 4.18.16
//        Rectangle
//        {
//            id: rect_big_wrapper
//            anchors.fill:parent
//            Settings
//            {
//                id: settings_global
//                property alias hss: video_dog.muted
//                property alias water_bottle: rect_big_wrapper.color
//            }

//            Timer
//            {
//                id: tmr_hello
//                interval: 5000 //5 seconds
//                running: true
//                onTriggered:
//                {
//                    video_dog.play();
//                }
//            }

//            Video
//            {
//                id: video_dog
//                source: "../../video/roses_for_the_dead.mp4"
//                anchors.horizontalCenter: parent.horizontalCenter
//                anchors.verticalCenter: parent.verticalCenter
//                //fillMode: VideoOutput.Stretch
//                height: 200
//                width: 200

//                //autoPlay: true

//                MouseArea
//                {
//                    id: ma_mousearea
//                    anchors.fill: parent
//                    //store the state of the video
//                    onClicked:
//                    {
//                        video_dog.muted = !video_dog.muted
//                    }
//                }
//            }
//            Row
//            {
//                spacing: 10

//                Repeater
//                {
//                    id: repeater_ashley
//                    model: 4
//                    anchors.top:video_dog.bottom
//                    anchors.horizontalCenter: parent.horizontalCenter

//                    Rectangle
//                    {
//                        height: 100
//                        width: 100

//                        color: Qt.hsla(Math.random(), .5, .5, 1);

//                        MouseArea
//                        {
//                            id: ma_mousearea_2
//                            anchors.fill: parent

//                            onClicked:
//                            {
//                                //reference rectangle inside a repeater
//                                rect_big_wrapper.color = repeater_ashley.itemAt(index).color
//                            }
//                        }
//                    }
//                }
//            }
//        }

}
