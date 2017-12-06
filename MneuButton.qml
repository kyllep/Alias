import QtQuick 2.0

Rectangle {

    signal cliched()

    property alias text: txt.text

    radius: height  / 10
    border.width: 10
    color: "green"

    width: parent.width *0.8
    height: 100

    Text {
        id: txt
        anchors.fill: parent
        fontSizeMode: Text.Fit
        font.pixelSize: 80
        text: qsTr("text")
    }

    MouseArea {
        anchors.fill: parent
        onClicked: cliched()
    }

}
