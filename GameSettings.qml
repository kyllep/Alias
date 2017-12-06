pragma Singleton
import QtQuick 2.0
import QtQml 2.0
import Qt.labs.settings 1.0

Settings {
//    id: guiSettings
    //-------------
    //NEXT move to lib
    property bool portrate: false
    property real dpi: 1
    property int windowWidth: 600
    property int windowHeight: 800

    property bool soundsEnabled: true
    property bool bannerVisible: false
    property real bannerHeight: 0
    property real bannerWidth: 0

    property string iconTheme: "test"
    //-------------

    property int timerInterval: 10
    property var players: []
    property var words: []
    property var playerSrores: []
    property var playerCurSrores: []
    property int curPlayerIndex: -1
    property int curRound: 1
    property bool roundEnd: false
    property int difficalty: 1
    property int lastWordIndex: 0



}
