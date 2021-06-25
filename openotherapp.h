#ifndef OPENOTHERAPP_H
#define OPENOTHERAPP_H

#include <QObject>
#include <QQuickItem>
#include <QVariant>
#include <QDebug>
#include <QTimer>
#include <QProcess>
class OpenOtherApp: public QObject
{
    Q_OBJECT
    //Q_PROPERTY(void best Read best WRITE setBest NOTIFY bestChanged)
    Q_PROPERTY(void best NOTIFY bestChanged)
public:
    OpenOtherApp(QObject *parent=0);
    ~OpenOtherApp();
    //Q_INVOKABLE GenerateAlgorithm algorithm() const;

signals:
    void bestChanged();

public slots:
    void openBookmarks();
    void openClock();
    void openBuzzer();
    void openBrowser();
    void openVideoplayer();
    void openFingerpaint();

private:
    void best();
    void setBest(double value);
    QTimer m_timer;
};

#endif // OPENOTHERAPP_H
