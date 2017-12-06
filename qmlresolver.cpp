#include "qmlresolver.h"
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QEventLoop>
#include <QTimer>
#include <QStringList>

QmlResolver::QmlResolver(QString projectName, QString filename, QObject *parent) : QObject(parent)
{
    qmlLoadPrefix = "qrc:/";
    assetsLoadPrefix = "qrc:/";
    QStringList ips;
                ips << "http://192.168.1.4:8085";
                ips << "http://192.168.1.4:8085";

#ifdef QT_DEBUG
    QEventLoop eventLoop;
    QTimer timer;

    timer.setSingleShot(true);
    QObject::connect(&timer, SIGNAL(timeout()), &eventLoop, SLOT(quit()));

    QNetworkAccessManager NAManager;
    QList<QNetworkReply*> replys;
    foreach (QString ip, ips)
    {
        QNetworkRequest request(QUrl(ip + "/" + projectName + "/" + filename));
        QNetworkReply *reply = NAManager.get(request);
        QObject::connect(reply, SIGNAL(finished()), &eventLoop, SLOT(quit()));
        replys << reply;
    }

    qDebug() << "loading";
    timer.start(300);
    eventLoop.exec();
    qDebug() << "end loading";

    for (int i = 0; i < ips.count(); i++)
    {
        QNetworkReply *reply = replys.at(i);
        if (reply->isFinished() && reply->error() == QNetworkReply::NoError)
        {
            auto url = ips.at(i);
            qmlLoadPrefix = url;
            assetsLoadPrefix = url+"assets/";
            qDebug() << "loading qml by network!! " << "url" << url;
            break;
        }
    }

    if (qmlLoadPrefix.startsWith("qrc:/"))
        qDebug() << "qml from resources";
#endif
}

