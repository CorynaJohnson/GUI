#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    //for settings
    QCoreApplication::setApplicationName("Budgie");
    QCoreApplication::setOrganizationName("GUI");
    QCoreApplication::setOrganizationDomain(".gobigorgohome");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
