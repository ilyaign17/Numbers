import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Page {
    id: game
    property alias backgroundColor: backgroundGame.color
    property alias buttonText: navGameButton.text
    signal buttonClicked();

    background: Rectangle {
        id: backgroundGame
    }

    GameBoard {
        anchors.fill: parent
    }

    Button {
        id: navGameButton
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.margins: defMargin
        onClicked: {
            game.buttonClicked();
        }
    }

}
