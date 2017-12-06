import QtQuick 2.0

Item {
    property int defV : 0
    property int curRes: 0

    signal vote(int v)

    width: height
    Text {
        id: txt
        anchors.fill: parent
        fontSizeMode: Text.Fit
        font.pixelSize: 80
        font.bold: true
        color: {
            if (curRes != defV) return "gray"
            if (defV == 1) return "green"
            if (defV == -1) return "red"
            if (defV == 0) return "black"
        }

        text:
        {
            if (defV == 1) return "+"
            if (defV == -1) return "-"
            if (defV == 0) return "x"
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: vote(defV)
    }
}
