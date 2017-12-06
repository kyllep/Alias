import QtQuick 2.0
import "." as Dir

Item {
    signal start()

    width: Dir.GameSettings.windowWidth
    height: Dir.GameSettings.windowHeight

    x: root.width
    Column {
        anchors.centerIn: parent

        Text {
            text: Dir.GameSettings.curRound >1 ?  qsTr("Полный счет:\n") : ""
        }

        Repeater {
            model: playesrModel
            delegate: Text {
                    text: model.name + ": " + Dir.GameSettings.playerSrores[model.index].toString()
                }
        }

        Text {
            text: qsTr("Раунд ") + Dir.GameSettings.curRound + ":\n"
        }

        Repeater {
            model: playesrModel
            delegate: Text {
                    text: name + ": " + Dir.GameSettings.playerCurSrores[index].toString()
                }
        }

        Text {
            text: Dir.GameSettings.roundEnd
                  ? qsTr("Раунд завершен")
                  : (qsTr("Сейчас играет: ") +Dir.GameSettings.players[Dir.GameSettings.curPlayerIndex])
        }
    }

    Rectangle {
        color: "yellow"

        width: 200
        height: 100

        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            anchors.centerIn: parent
            text: Dir.GameSettings.roundEnd ? qsTr("Следующий раунд") : qsTr("Поехали")

        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (Dir.GameSettings.roundEnd)
                {
                    Dir.GameSettings.curRound++;
                    for (var i = 0; i < playesrModel.count; i++)
                    {
                        Dir.GameSettings.playerSrores[i] = Math.round(Dir.GameSettings.playerSrores[i]) + Math.round(Dir.GameSettings.playerCurSrores[i]);
                        Dir.GameSettings.playerCurSrores[i] = 0;
                    }
                    Dir.GameSettings.playerSrores = Dir.GameSettings.playerSrores;
                    Dir.GameSettings.playerCurSrores = Dir.GameSettings.playerCurSrores
                    Dir.GameSettings.roundEnd = false;
                }
                else start()
            }
        }

    }


}
