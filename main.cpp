#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QList>
#include "devicecontroller.h"
//#include "../adctl/adctl.h"
#include <QQuickStyle>
#include "qmlresolver.h"
int main(int argc, char *argv[])
{
    QString appName = "Alias";

    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    app.setOrganizationName("Kyllep");
    app.setApplicationName(appName);
    app.setApplicationVersion("1.0");

    QQuickStyle::setStyle("Material");

    QmlResolver* qmlResolver = new QmlResolver("Alias");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("DeviceController", &DeviceController::instance());
    engine.rootContext()->setContextProperty("qmlLoadPrefix", qmlResolver->qmlLoadPrefix);
//    engine.rootContext()->setContextProperty("assetsLoadPrefix", assetsLoadPrefix);

    engine.load(QUrl(qmlResolver->qmlLoadPrefix + "main.qml"));

    return app.exec();
}
