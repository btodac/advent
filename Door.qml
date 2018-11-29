import QtQuick 2.7
/* This code makes a clickable door in the calender. Its position, image and openable date can be set
   in the when called.*/
Item {
    property real xpos: 0 // x position of door
    property real ypos: 0 // y position of door
    property real imgwidth: 0 // door width
    property string file: "" // path to the cuddly animal picture
    property string doordate: "20170929" // The date at which the door can be opened
    property int number: 0

    property url background: parent.source // background image
    property real backgroundwidth: parent.parent.width // background image width
    property bool islocked: mainwin.today.localeCompare(doordate)<0 // Is the door locked or not?
    property bool isopen: false // Is the door open or not

    /* This image holds the photo that sits behind the door */
    Image {
        id: image1
        fillMode: Image.PreserveAspectFit
        source: file // The cuddly animal
        width: imgwidth
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: xpos
        anchors.topMargin: ypos
    }
    /*The door which covers the image. It scales and moves with the background and also
      rotates about the y axis for the "door openeing effect".*/
    /*The rectangle acts as a mask for the backgound image on the front of the door*/
    Rectangle{
        id: door
        property real theta: 0 // variable angle for opening the door
        state:
        {
            if(isopen) "open"
            else  "closed" // Initial state of the door!
        }


        clip: true // clips the door to the rectangle
        width: image1.width // Sets the door to the same size as the revealed image
        height: image1.height
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: xpos
        anchors.topMargin: ypos
        // The following transform defines the plane to which the angle theta is measured
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
                    datastore.addnum(number)
                }
            }
        }

        /* The backround image printed on the door is the same size as the background but
        clipped to the door */
        Image {
            source: background //"qrc:///images/baseimage.jpg"
            fillMode: Image.PreserveAspectFit
            width: parent.parent.parent.width //mainwin.width //* 6/5
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -xpos
            anchors.topMargin: -ypos
        }
        Text {
            text: number
            color: "gold"
            font.bold: true
            font.pixelSize: { if (number==24) parent.width/10
                              else parent.width/5}
            anchors.right:parent.right
            anchors.verticalCenter: parent.verticalCenter
        }
        /* The back of the door, the opacity goes to 1 when opened */
        Rectangle {
           id: doorback
           width: parent.width
           height: parent.height
           anchors.left: parent.left
           anchors.top: parent.top
           color: "black"
           opacity: 0
        }

        // The open and closed state of the door. Different thetas for the open or closed door
        states: [
            State {
                name: "closed"
                PropertyChanges {target: door; theta: 0}
                PropertyChanges {target: doorback; opacity: 0}
            },
            State {
                name: "open"
                PropertyChanges {target: door; theta: -100}
                PropertyChanges {target: doorback; opacity: 1}
            }
        ]
        /* The transition between closed and open. The duration controls the time taken
        to opening the door */
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
                OpacityAnimator {
                    target: doorback
                    from: 0
                    to: 1
                    duration: 2700
                }
            }
        ]
    }
}

