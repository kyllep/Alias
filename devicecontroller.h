#ifndef DEVICECONTROLLER_H
#define DEVICECONTROLLER_H

#pragma once
#include <QObject>

class DeviceController  : public QObject
{
      Q_OBJECT

public:
    DeviceController(QObject *parent = NULL);

    static DeviceController &instance(QObject *parent = 0);

    Q_INVOKABLE void keepScreenOn(bool on);
};

#endif // DEVICECONTROLLER_H
