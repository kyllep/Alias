import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import "." as Dir

Item {
    signal newGame();
    signal resumeGame();

    width: Dir.GameSettings.windowWidth
    height: Dir.GameSettings.windowHeight

    Column {
        anchors.fill: parent
        Button {
            text: qsTr("Новая игра")
            onClicked:  {
                newGame()
            }
        }

        Button {
            text: qsTr("Продолжить")
            onClicked: {
                resumeGame()
            }
        }
    }
}
