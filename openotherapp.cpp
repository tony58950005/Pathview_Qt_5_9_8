#include "openotherapp.h"
#include <QObject>
#include <QProcess>
#include <QDebug>

OpenOtherApp::OpenOtherApp(QObject *parent)
    :QObject(parent)
{

}

OpenOtherApp::~OpenOtherApp(){

}

void OpenOtherApp::openBookmarks(){
    QProcess *parent;
   //QProcess::start("gnome-terminal");
    QProcess *myProcess = new QProcess(parent);
    qDebug() << "Have myProcess01";
//    QString program ="/home/topeet/build-analogclock-Qt_5_12_0-Debug/analogclock";
    QString program ="dombookmarks";
//    QString program ="/media/topeet/KINGSTON/clock_qml";
//    QProcess::execute("/opt/newDir/clock_qml");
//    QProcess::execute("usr/share/qt5/example/xml/dombookmarks/dombookmarks");
//    myProcess->start("gnome-terminal");
//    myProcess->start("/opt/Qtworkspace/clock_qml/./clock_qml");
    myProcess->start(program);
    myProcess->waitForStarted();
    qDebug()<< myProcess->readAllStandardOutput();
    return;
}

void OpenOtherApp::openClock(){
    QProcess *parent;
    QProcess *myProcess = new QProcess(parent);
    qDebug() << "Have Clock";
    QString program ="clock_qml";
    myProcess->start(program);
    myProcess->waitForStarted();
    qDebug()<< myProcess->readAllStandardOutput();
    return;
}

void OpenOtherApp::openBuzzer(){
    QProcess *parent;
    QProcess *myProcess = new QProcess(parent);
    qDebug() << "Have Buzzer";
    QString program ="buzzer";
    QStringList arguments;
    arguments << "/dev/buzzer_ctl";
    myProcess->start(program,arguments);
    myProcess->waitForStarted();
    qDebug()<< myProcess->readAllStandardOutput();
    return;
}

void OpenOtherApp::openBrowser(){
    QProcess *parent;
    QProcess *myProcess = new QProcess(parent);
    qDebug() << "Have Browser";
    QString program ="QWebBrowser";
    myProcess->start(program);
    myProcess->waitForStarted();
    qDebug()<< myProcess->readAllStandardOutput();
    return;
}

void OpenOtherApp::openVideoplayer(){
    QProcess *parent;
    QProcess *myProcess = new QProcess(parent);
    qDebug() << "Have Videoplayer";
    QString program ="QMediaPlayer";
    myProcess->start(program);
    myProcess->waitForStarted();
    qDebug()<< myProcess->readAllStandardOutput();
    return;
}

void OpenOtherApp::openFingerpaint(){
    QProcess *parent;
    QProcess *myProcess = new QProcess(parent);
    qDebug() << "Have Fingerpaint";
    QString program ="fingerpaint";
    myProcess->start(program);
    myProcess->waitForStarted();
    qDebug()<< myProcess->readAllStandardOutput();
    return;
}



