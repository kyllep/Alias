#ifndef QMLRESOLVER_H
#define QMLRESOLVER_H

#include <QObject>
#include <QString>



class QmlResolver : public QObject
{
    Q_OBJECT
public:
    explicit QmlResolver(QString projectName, QString filename = "main.qml", QObject *parent = nullptr);

    QString qmlLoadPrefix;
    QString assetsLoadPrefix;

signals:
    void stopWait();

public slots:



};

#endif // QMLRESOLVER_H
