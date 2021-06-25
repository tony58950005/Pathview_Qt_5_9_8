TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    openotherapp.cpp

RESOURCES += qml.qrc \
    img.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    ../UI_design_qml/calendar_icon.svg.png \
    ../UI_design_qml/camera_icon.svg.png \
    ../UI_design_qml/music_icon.svg.png \
    ../UI_design_qml/todo_icon.svg.png \
    calendar_icon.svg.png \
    camera_icon.svg.png \
    music_icon.svg.png \
    todo_icon.svg.png \
    welcome_icon.svg.png

HEADERS += \
    openotherapp.h

