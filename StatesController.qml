import QtQuick 2.0
import "." as Dir
Item {

    property var stateItem: menu
    property var prevStateItem: null
    onStateItemChanged:  {
        if (prevStateItem != null)
        {
            prevStateItem.x = root.width
        }

        stateItem.x = 0
        prevStateItem = stateItem

    }

//    states: [
//        State {
//            name: "menu"
//            PropertyChanges {
//                target: menu
//                x: 0
//            }
//            PropertyChanges {
//                target: gameScore
//                x: root.width
//            }
//            PropertyChanges {
//                target: newGameSettigs
//                x: root.width
//            }

//            PropertyChanges {
//                target: gamePlay
//                x: root.width
//            }
//            PropertyChanges {
//                target: guessResults
//                x: root.width
//            }
//        },

//        State {
//            name: "gameScore"
//            PropertyChanges {
//                target: gameScore
//                x: 0
//            }
//            PropertyChanges {
//                target: menu
//                x: root.width
//            }
//            PropertyChanges {
//                target: gamePlay
//                x: root.width
//            }
//            PropertyChanges {
//                target: guessResults
//                x: root.width
//            }
//            PropertyChanges {
//                target: newGameSettigs
//                x: root.width
//            }
//        },
//        State {
//            name: "guessResults"
//            PropertyChanges {
//                target: guessResults
//                x: 0
//            }
//            PropertyChanges {
//                target: menu
//                x: root.width
//            }
//            PropertyChanges {
//                target: gamePlay
//                x: root.width
//            }
//            PropertyChanges {
//                target: gameScore
//                x: root.width
//            }
//            PropertyChanges {
//                target: newGameSettigs
//                x: root.width
//            }

//        },
//        State {
//            name: "gamePlay"
//            PropertyChanges {
//                target: gamePlay
//                x: 0
//            }
//            PropertyChanges {
//                target: menu
//                x: root.width
//            }
//            PropertyChanges {
//                target: gameScore
//                x: root.width
//            }
//            PropertyChanges {
//                target: guessResults
//                x: root.width
//            }
//            PropertyChanges {
//                target: newGameSettigs
//                x: root.width
//            }
//        },
//        State {
//            name: "newGameSettigs"
//            PropertyChanges {
//                target: newGameSettigs
//                x: 0
//            }
//            PropertyChanges {
//                target: menu
//                x: root.width
//            }
//            PropertyChanges {
//                target: gameScore
//                x: root.width
//            }
//            PropertyChanges {
//                target: gamePlay
//                x: root.width
//            }
//            PropertyChanges {
//                target: guessResults
//                x: root.width
//            }
//            PropertyChanges {
//                target: guessResults
//                x: root.width
//            }
//        }





//    ]
}
