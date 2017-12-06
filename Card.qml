import QtQuick 2.0
import "." as Dir
Rectangle {
    id: cardWrap
    property string text: "tetx"
    signal acepted(bool last)
    signal rejected(bool last)

    width: 600
    height: 800

    property real vCenter: cardWrap.height * (1-cardWrap.ofparent) * 0.5
    property real hCenter: cardWrap.width* (1-cardWrap.ofparent) * 0.5
    property real ofparent: 0.75

    Dir.CardMaket {
        id: bgCard
        width: cardWrap.width*ofparent
        height: cardWrap.height*ofparent
        x: hCenter
        y: vCenter
    }

    Text {
        text: qsTr("+") + pluses
        anchors.top: bgCard.top
        anchors.left: bgCard.right
        anchors.margins: parent.width/50
        color: "green"
    }

    Text {
        text: qsTr("-") + minuses
        anchors.bottom: bgCard.bottom
        anchors.left: bgCard.right
        anchors.margins: parent.width/50
        color: "red"
    }

    property int pluses: 0
    property int minuses: 0
    function checkAcept(last)
    {
        if (activeCard.y != vCenter)
        {
            if (activeCard.y < vCenter){
                pluses++;
                acepted(last)
            }
            else {
                minuses++;
                rejected(last)
            }
            moveAnim.restart()
        }
    }

    Dir.CardMaket {
        id: activeCard
        width: cardWrap.width*ofparent
        height: cardWrap.height*ofparent
        x: hCenter
        y: vCenter

        MouseArea {
            id: area
            anchors.fill: parent
            drag.target: parent
            onReleased: checkAcept(false)
        }

        colropacity: {
            var delta = Math.abs(activeCard.y - vCenter)
            if (delta == 0) return 1;
            delta = (delta / vCenter)
            if (delta > 1)
                delta = 1;

            return 1- delta
        }


        color: {
            if (activeCard.y < vCenter)
                return   "green"
            if (activeCard.y > vCenter)
                return  "red"
            return "white"
        }
    }

    SequentialAnimation {
        id: moveAnim
        running: false

        ParallelAnimation {
            PropertyAnimation {
                target: activeCard
                property: "y"
                duration: 200
                to: (activeCard.y < vCenter)
                        ? -cardWrap.height
                        : cardWrap.height*2
            }

            PropertyAnimation {
                target: activeCard
                property: "x"
                duration: 200
                to: {

                    var dx = activeCard.x - hCenter
                    var dy = activeCard.y - vCenter
                    var to = (activeCard.y < vCenter)
                            ? -cardWrap.height
                            : cardWrap.height*2;
                    return to * dx / dy;
                }
            }
        }



        ScriptAction {
            script: {
                activeCard.x = hCenter
                activeCard.y = vCenter
            }
        }
    }

}
