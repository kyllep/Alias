import QtQuick 2.7
//import QtGraphicalEffects 1.0
import "." as Dir

    Image {
        id: imgBtn
        property string themeName: Dir.GameSettings.iconTheme
        property string iconName: "arrowdown.png"
        property color coler: "transparent"
        source: "img/" + iconName
        smooth: true

        signal clicked();

        MouseArea {
            anchors.fill: parent
            onPressed: parent.scale = 0.9
            onReleased: parent.scale = 1
            onClicked: imgBtn.clicked()
        }

    //    ColorOverlay {
    //       anchors.fill: parent
    //       source: parent
    //       color: parent.coler //trasparent
    //   }
    }

