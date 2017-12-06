#include "devicecontroller.h"
#if defined(Q_OS_ANDROID)
    #include <QAndroidJniObject>
    #include <QtAndroidExtras>
    #include <QtAndroid>
#endif

#include <QGuiApplication>
#include <QScreen>

DeviceController::DeviceController(QObject *parent)
{
//    qreal refDpi = 480.;
//    qreal refHeight = 1860.;
//    qreal refWidth = 1080.;
//    QRect rect = QGuiApplication::primaryScreen()->geometry();
//    qreal height = qMax(rect.width(), rect.height());
//    qreal width = qMin(rect.width(), rect.height());
//    qreal dpi = QGuiApplication::primaryScreen()->logicalDotsPerInch();
//    m_ratio = qMin(height/refHeight, width/refWidth);
//    m_ratioFont = qMin(height*refDpi/(dpi*refHeight), width*refDpi/(dpi*refWidth));
}

DeviceController &DeviceController::instance(QObject *parent)
{
    static DeviceController instance(parent);
    return instance;
}


void DeviceController::keepScreenOn(bool on)
{
#if defined (Q_OS_ANDROID)
    QtAndroid::runOnAndroidThread([on]
    {
        QAndroidJniObject activity = QtAndroid::androidActivity();
        if (activity.isValid()) {
          QAndroidJniObject window =
              activity.callObjectMethod("getWindow", "()Landroid/view/Window;");

          if (window.isValid()) {
            const int FLAG_KEEP_SCREEN_ON = 128;
            if (on) {
              window.callMethod<void>("addFlags", "(I)V", FLAG_KEEP_SCREEN_ON);
            } else {
              window.callMethod<void>("clearFlags", "(I)V", FLAG_KEEP_SCREEN_ON);
            }
          }
        }
        QAndroidJniEnvironment env;
        if (env->ExceptionCheck()) {
          env->ExceptionClear();
        }
      });
#endif
}
