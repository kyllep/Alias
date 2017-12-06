import QtQuick 2.0
import QtQuick.Controls 2.2
//import QtQuick.Controls.Material 2.2

import "." as Dir

Item {
    id: newGameSettigs

    signal startGame();

    width: Dir.GameSettings.windowWidth
    height: Dir.GameSettings.windowHeight

    x: root.width

    ListView {
        id: playerslist
        model: playesrModel
        height: childrenRect.height
        width: childrenRect.width
        delegate: Dir.CammandDelegate {

        }
    }





    Button {
        id: addBtn
        anchors.top: playerslist.bottom
        text: qsTr("Добавить")
        onClicked: {
            GameSettings.playerCurSrores.push(0)
            GameSettings.playerSrores.push(0)
            GameSettings.playerCurSrores = GameSettings.playerCurSrores
            GameSettings.playerSrores  =GameSettings.playerSrores


            var pName = cmdManager.getRandom()
            GameSettings.players.push(pName)
            playesrModel.append({
                                    "name": pName,
                                    "index": playesrModel.count
                                })
            GameSettings.players = GameSettings.players
        }
    }

    Dir.CommandNameManager {
        id: cmdManager
    }


    Button {
        text:  qsTr("Поехали")
        anchors.bottom: parent.bottom
        onClicked: startGame()
    }






}
