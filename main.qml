import QtQuick 2.8
//import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import "." as Dir
//import ru.forsk.adctl 1.0

ApplicationWindow  {
    visible: true
    width: Dir.GameSettings.windowWidth
    height: Dir.GameSettings.windowHeight
    title: qsTr("Hello World")

    Material.theme: Material.Light
    Material.accent: Material.Orange

    id: root

    Dir.MenuWidget {
        id: menu
        onNewGame: {
            Dir.GameSettings.curRound = 1
            Dir.GameSettings.roundEnd = false
            Dir.GameSettings.players = []
            Dir.GameSettings.curPlayerIndex = 0;
            Dir.GameSettings.playerSrores = []
            Dir.GameSettings.playerCurSrores = []
            playesrModel.clear()
            statesController.stateItem = newGameSettigs
        }

        onResumeGame: {
            statesController.stateItem = gameScore
        }
    }

    Dir.NewGameSettings {
        id: newGameSettigs
        onStartGame: {
            statesController.stateItem = gameScore
        }
    }

    Dir.GamePlay {
        id: gamePlay
        onStoped: {

            statesController.stateItem = guessResults
        }
    }

    Dir.GuessResults {
        id: guessResults
        onExit: {


            statesController.stateItem = gameScore
        }
    }

    //TODO выйгрыш
    //TODO меню
    //TODO настройки игры: сложность , команды, время, открытый раунд

    ListModel {
        id: playesrModel
    }

    Dir.GameScores {
        id: gameScore
        onStart: {
            gamePlay.start()
            statesController.stateItem = gamePlay
        }

    }

    Dir.StatesController {
        id: statesController
        state: "menu"
    }



    /*
        AdCtl {
               id: adCtl
               startAdBannerEnabled: true
                startAdId: "5993d2b7f3fc9071008b4567"
                startAdBannerPosition: Qt.point(0,-500)

                onStartAdBannerShowed: {
                           console.log("onStartAdBannerShowed");
                           startAdBannerPosition = Qt.point(0,
                                                    (appWindow.height - adCtl.startAdBannerHeight * 1.3))
                       }
        }

        */

    //чтобы не гас экран https://developer.android.com/reference/android/os/PowerManager.html
    // https://developer.android.com/training/scheduling/wakelock.html
    // https://stackoverflow.com/questions/27758499/how-to-keep-the-screen-on-in-qt-for-android
    onWidthChanged: Dir.GameSettings.windowWidth = width;
    onHeightChanged: Dir.GameSettings.windowHeight = height;
    Component.onCompleted: {
        Dir.GameSettings.windowWidth = width;
        Dir.GameSettings.windowHeight= height;

        if (Dir.GameSettings.players.length != 0)
        {
            for (var i = 0; i < Dir.GameSettings.players.length; i++)
            {
                playesrModel.append({
                                        "name": Dir.GameSettings.players[i],
                                        "index": i
                                    })
                console.debug(playesrModel.get(i).name)
            }
        }


        //NEXT для активити http://qmlbook.github.io/en/ch07/index.html#canvas-paint


    }

}
