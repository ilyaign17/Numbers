import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Page {
    id: start
    property alias backgroundColor: backgroundStart.color
    property alias buttonText: navStartButton.text
    signal buttonClicked();

    background: Rectangle {
        id: backgroundStart
    }

    Button {
        id: navStartButton
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: defMargin
        onClicked: {
            start.buttonClicked();
        }
    }

}
