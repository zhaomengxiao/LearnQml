import QtQuick 2.12
import QtQuick.Window 2.12


Window{
    id: window
    width: 150
    height: 300
    visible: true
    Item {
        anchors.fill: parent
    Rectangle {
        id: greenLight
        width: 100
        height: 100
        radius: width/2
        anchors.top: redLight.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        color: "black"


    }
    Rectangle {
        id: redLight
        width: 100
        height: 100
        radius: width/2
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        color: "black"
    }

    states: [
        State {
            name: "go"
            PropertyChanges {
                target: redLight
                color:"black"
            }
            PropertyChanges {
                target: greenLight
                color:"green"
            }
        },
        State {
            name: "stop"
            PropertyChanges {
                target: redLight
                color:"red"
            }
            PropertyChanges {
                target: greenLight
                color:"black"
            }
        }
    ]

    transitions: [
        Transition {
            from: "*"
            to: "*"

            ColorAnimation {
                target: redLight
                properties: "color"
                duration: 100
            }
            ColorAnimation {
                target: greenLight
                properties: "color"
                duration: 100
            }
        }
    ]

    MouseArea{
        anchors.fill: parent
        onClicked:
        {
            console.debug("click")
            if (parent.state == "stop")
            {
                parent.state = "go";
            }
            else{
                parent.state = "stop";
            }
        }
    }



}
}
