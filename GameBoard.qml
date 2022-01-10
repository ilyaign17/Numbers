import QtQuick 2.0
import GameModel 1.0
GridView {
    id: root
    model: GameBoardModel {

    }


    cellWidth: width / 5
    cellHeight: height / 8

    delegate: Item {
        id: backgroundDelegate
        width: root.cellWidth
        height: root.cellHeight

        Tile {
            anchors.fill: backgroundDelegate

            internalText.text: display.toString()
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (root.model.move(index))
                        backgroundDelegate.visible = false

                    if(root.model.check(index))
                        navGameButton.visible = true
                }
            }
        }

    }
}
