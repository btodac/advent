import QtQuick 2.0

Item {
    property real xpos: 0 // x position of door
    property real ypos: 0 // y position of door
    property real imgwidth: 0 // door width
    property string file: "" // path to the cuddly animal picture
    property string doordate: "20170929" // The date at which the door can be opened


    property url background: parent.source // background image
    property real backgroundwidth: parent.parent.width // background image width
    property bool islocked: mainwin.today.localeCompare(doordate)<0 // Is the door locked or not?
    property bool isopen: false // Is the door open or not

    Image {
        id: image1
        fillMode: Image.PreserveAspectFit
        source: file // The cuddly animal
        width: imgwidth
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: xpos //background.width * 1/10
        anchors.topMargin: ypos //background.height * 1/10
    }
// The door which scales and moves with the background and also rotates about the y axis for the "door openeing effect"
    Rectangle{
        id: door
        property real theta: 0 // variable angle for opening the door
        state: "closed" // State of the door!
        clip: true // clips the door to the rectangle
        width: image1.width // Sets the door to the same size as the revealed image
        height: image1.height
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: xpos //background.width * 1/10
        anchors.topMargin: ypos //background.height * 1/10
        transform: Rotation { origin.x: 0; origin.y: 30 ;axis { x: 0; y: 1; z: 0 } angle: door.theta }
        // When clicked the script checks to see of the door is openable
        MouseArea{
            id: handel
            anchors.fill: parent
            onPressed: {
                if (islocked) {
                    isopen: false
                    door.state = "closed"
                }
                else {
                    isopen: true
                    door.state = "open"
                }
            }
        }

        // The backround image clipped to the door
        Image {
            source: background //"qrc:///images/baseimage.jpg"
            fillMode: Image.PreserveAspectFit
            width: parent.parent.parent.width //mainwin.width //* 6/5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -xpos //background.width * 1/10
            anchors.topMargin: -ypos //background.height * 1/10
        }

        // The open and closed state of the door
        states: [
            State {
                name: "closed"
                PropertyChanges {target: door; theta: 0}
            },
            State {
                name: "open"
                PropertyChanges {target: door; theta: -100}
            }
        ]
        transitions: [
            // opens the door
            Transition {
                from: "closed"
                to: "open"
                PropertyAnimation {
                    target: door
                    property: "theta"
                    duration: 3000
                }
            }
        ]
    }
}

