#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Budget.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Budget budget;

    //for settings
    QCoreApplication::setApplicationName("Budgie");
    QCoreApplication::setOrganizationName("GUI");
    QCoreApplication::setOrganizationDomain(".gobigorgohome");

    engine.rootContext()->setContextProperty("Budget", &budget);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));



    return app.exec();
}
