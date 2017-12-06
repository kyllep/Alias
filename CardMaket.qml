import QtQuick 2.0

Rectangle {
    property alias colropacity: colorRect.opacity
    border.color: "black"
    border.width: 10
    radius: Math.min(width, height) /10

    Rectangle {
        id: colorRect
        anchors.fill: parent
        color: "white"
        border.color: parent.border.color
        border.width: parent.border.width
        radius: parent.radius
    }

    Text {
        id: textStr
        text: cardWrap.text
        anchors.centerIn: parent
    }
}
