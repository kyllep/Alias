import QtQuick 2.0
import "." as Dir

Item {

    id: gamePlay
    signal stoped();
    property alias words: wordsModel

    width: Dir.GameSettings.windowWidth
    height: Dir.GameSettings.windowHeight

    x: root.width

//    onXChanged: DeviceController.keepScreenOn(x == 0)

    ListModel {
        id: wordsModel
    }

    function start()
    {
        wordsModel.clear()
        card.genText()
        card.pluses = 0
        card.minuses = 0
        timerText.elapsed = Dir.GameSettings.timerInterval;
        timer.start();
    }



    Timer {
        id: timer
        interval: 1000
        repeat: true
        onTriggered: {
            console.debug("timer")
            timerText.elapsed -=1;
            if (timerText.elapsed == 0)
            {
                card.checkAcept(true)
                stop();
                stoped();
            }
        }
    }



    //TODO масштаб по экрану
    Dir.Pack {id: words}

    Dir.Card {

        id: card
        function genText(){
            text =  words.getRandom()
            wordsModel.append({"text": text, "res": 0})
            console.debug(Dir.GameSettings.words)
        }

        enabled: timer.running
        anchors.fill: parent
        text: words.words[Dir.GameSettings.lastWordIndex]
        onAcepted: gamePlay.acepted(last)
        onRejected: gamePlay.rejected(last)
    }


    function acepted(last) {
        wordsModel.get(wordsModel.count-1).res = 1

        if (!last) card.genText()
    }

    function rejected(last)
    {

        wordsModel.get(wordsModel.count-1).res = -1
       if (!last) card.genText()
    }


    Text {
        id: timerText
        anchors.top: parent.top
        property int elapsed: 0
        text: qsTr("Осталось: " + elapsed)
    }



}
