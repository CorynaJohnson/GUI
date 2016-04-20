TEMPLATE = app

QT += qml quick

CONFIG += c++11

SOURCES += main.cpp \
    Category.cpp \
    Budget.cpp

RESOURCES += \
    qml.qrc \
    img.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES +=

HEADERS += \
    Category.h \
    Budget.h
