import QtQuick 2.12
//import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

ApplicationWindow {
    id: window
//    width: 640
//    height: 480
    visible: true
    title: qsTr("Hello World")

    property int defMargin: 10

    StackView {
        id: stackProj
        anchors.fill: parent
        initialItem: pageStart
    }

    Start {
        id: pageStart
        backgroundColor: "red"
        buttonText: "К игре"
        onButtonClicked: {
//            Game;
            stackProj.push(pageGame)
        }
    }

    Game {
        id: pageGame
        visible: false
        backgroundColor: "blue"
        buttonText: "На главную"
        onButtonClicked: {
            stackProj.pop()
        }
    }


}
