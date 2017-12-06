import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import "." as Dir
Rectangle {
    property bool editMode: false

    width: newGameSettigs.width
    height: 100

    Loader {
        anchors.fill:  parent
        sourceComponent: editMode
                          ? editComponent
                          : txtComponent
    }

    Component{
        id: txtComponent
        Item {
            anchors.fill: parent
            Text {
                anchors.fill: parent
                text: model.name
            }

            RoundButton {
                text: "\u2712"
                anchors.centerIn: parent
                onClicked: {
                    editMode  = true
//                    newCmdName.text = newCmdName
                }
            }
        }
    }

    Component {
        id: editComponent
        Item {
             anchors.fill: parent
            TextField {
                id: newCmdName
                placeholderText: qsTr("Название команды")
                text: model.name
            }

            RoundButton {
                text: "\u2713"
                    anchors.right: parent.right
                onClicked: {
                    model.name = newCmdName.text
                    Dir.GameSettings.players[model.index] = newCmdName.text
                    Dir.GameSettings.players = Dir.GameSettings.players
                    editMode  = false
                }
            }
        }
    }


//2716

}
