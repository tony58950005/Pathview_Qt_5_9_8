#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
//#include <QThread>
#include <QQmlEngine>
#include <QQmlApplicationEngine>
#include <QProcess>
#include <QGuiApplication>
#include <QQuickWindow>
#include "openotherapp.h"
#include <QQmlEngine>
#include <QtQml>
#include <QQuickView>

int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);
//    OpenOtherApp testObj;
    qmlRegisterType<OpenOtherApp>("com.company.openotherapp",1,0,"Openotherapp");
    QQuickView viewer;
    viewer.rootContext()->setContextProperty("openOtherApp", new OpenOtherApp);
    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
    viewer.setSource(QUrl("qrc:///main.qml"));
    viewer.show();

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    QObject::connect(viewer.engine(), SIGNAL(quit()), &app, SLOT(quit()));

//    QObject::connect(viewer.engine(), SIGNAL(quit()), &app, SLOT(quit()));

//    QQmlApplicationEngine engine;

    //QObject::connect(this,SIGNAL(clicked()),this,SLOT(openTerminal()));
//    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
//    QProcess *pros=new QProcess;
//    pros->start("gnome-terminal");

//    if(engine.rootObjects().isEmpty())
//        return -1;
    return app.exec();
}



