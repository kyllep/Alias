import QtQuick 2.0
import "." as Dir

Item {
    id:wraper
    signal vote(int v)

    width: 800
    height: 100

            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: voteRow.left
                anchors.left: parent.left
                fontSizeMode: Text.Fit
                font.pixelSize: 80
                text: {
                    console.debug(model.index)
                    return model.index != -1
                            ? model.text
                            : ""
                }
            }
            Row {
                id: voteRow
                anchors.right: parent.right

                Dir.GuessVoteBtn {
                    defV: 1
                    curRes: model.res
                    height: wraper.height
                    onVote:  wraper.vote(v)
                }

                Dir.GuessVoteBtn {
                    defV: -1
                    curRes: model.res
                    height: wraper.height
                    onVote:  wraper.vote(v)
                }

                Dir.GuessVoteBtn {
                    defV: 0
                    curRes: model.res
                    height: wraper.height
                    onVote:  wraper.vote(v)
                }
            }
        }
