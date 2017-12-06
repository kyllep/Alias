TEMPLATE = app

QT += qml quick network
CONFIG += c++11
CONFIG+=qml_debug

android: {
  QT += androidextras  quickcontrols2
}

SOURCES += main.cpp \
    devicecontroller.cpp \
    qmlresolver.cpp

HEADERS += \
    devicecontroller.h \
    qmlresolver.h

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =


# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
#include(../adctl/com_github_kafeg_adctl.pri)

android {
    DISTFILES += \
        android/AndroidManifest.xml \
        android/gradle/wrapper/gradle-wrapper.jar \
        android/gradlew \
        android/res/values/libs.xml \
        android/build.gradle \
        android/gradle/wrapper/gradle-wrapper.properties \
        android/gradlew.bat
    #    $$ANDROID_PACKAGE_SOURCE_DIR/src/ru/forsk/AdCtl/AdCtlActivity.java
    #    $$ANDROID_PACKAGE_SOURCE_DIR/src/com/kyllep/alias/MyActivity.java

}
