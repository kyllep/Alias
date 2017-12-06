import QtQuick 2.7
import "." as Dir

Item {
    signal exit()
    width: Dir.GameSettings.windowWidth
    height: Dir.GameSettings.windowHeight

    x: root.width
    ListView {
        anchors.bottom: guessResRect.top
        anchors.top: parent.top
        width: parent.width
        model: gamePlay.words
        delegate: Dir.VoteDelegate {
            width: parent.width

            onVote: {
                if (v != model.res)
                {
                    model.res = v;
                }
            }
        }
    }


    property int guessRes: {
        var r = 0;
        for (var i = 0; i < gamePlay.words.count; i++)
            r+= gamePlay.words.get(i).res;


        return r;
    }

    onGuessResChanged: {
        GameSettings.playerCurSrores[GameSettings.curPlayerIndex] = guessRes
        GameSettings.playerCurSrores = GameSettings.playerCurSrores
    }

    Rectangle {
        id: guessResRect
        anchors.bottom: okBtn.top
        width: parent.width
        height: 100
//        color: "green"

        Text {
            text: qsTr("Результат: ") + guessRes
        }
    }


    Rectangle {
        id: okBtn
        anchors.bottom: parent.bottom
        width: parent.width
        height: 100
        color: "green"

        Text {
            text: qsTr("Все верно")
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (GameSettings.curPlayerIndex == playesrModel.count -1)
                {
                    GameSettings.roundEnd = true;
                    GameSettings.curPlayerIndex = 0;
                }
                else GameSettings.curPlayerIndex++;
                exit()
            }
        }
    }


}
