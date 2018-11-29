import QtQuick 2.7
import QtQuick.Window 2.2

/* Needs smart phone abilities, sliding/zooming/tapping, and door unlocks based on date! */
/* This is the the advent calender for android 2017! */
Window {
    // Main window settings
    id: mainwin
    visible: true
    width: Screen.width
    height: Screen.height
    title: qsTr("Advent Calender 2018")
    // Get the date settings and store in in usefull format
    property var locale: Qt.locale()
    property string today: new Date().toLocaleString(locale, "yyyyMMdd") // todays date
    // This makes a black background for when the image cant fill the screen when the user scrolls around
    Rectangle{
        id: canvas1
        anchors.fill: parent
        anchors.centerIn: parent
        color: "#000000"
    }
    // The background image which scales with the window while preserving aspect ratio
    Flickable { // This is a one finger flickable/movable area to allow the user to scroll through the image
        id: flick
        anchors.fill: parent
        contentWidth: background.width
        contentHeight: background.height
        boundsBehavior: Flickable.StopAtBounds
        // This is a pinchable area to allow the user to zoom in and out of the image
        PinchArea {
            id: pa
            width: Math.max(flick.contentWidth, flick.width)
            height: Math.max(flick.contentHeight, flick.height)
            property real initialWidth
            property real initialHeight
            property real newWidth
            property real newHeight
            // When the user starts the pinch the initial dimensions of the content are recorded
            onPinchStarted: {
                initialWidth = flick.contentWidth
                initialHeight = flick.contentHeight
            }
            // As the user moves their fingers the image scales
            onPinchUpdated: {
                // Calculate the new image dimensions
                newWidth = initialWidth * pinch.scale
                newHeight = initialHeight *pinch.scale
                // resize content
                if ((newWidth < background.sourceSize.width)&&(newWidth > mainwin.width))
                {
                    // adjust content pos due to drag
                    flick.contentX +=  pinch.previousCenter.x - pinch.center.x
                    flick.contentY +=  pinch.previousCenter.y - pinch.center.y
                    flick.resizeContent(newWidth, newHeight, pinch.center)
                    // Update background width
                    background.width = flick.contentWidth
                }
            }
            onPinchFinished: {
                // Move content within bounds.
                flick.returnToBounds()
            }
        }
        Image {
            // This is the main image of the calender
            id: background
            source: "qrc:///images/baseimage.jpg"
            fillMode: Image.PreserveAspectFit
            width: flick.width //* 6/5
            // Door that opens only at specific date
            Door {
                xpos: parent.width * 6/30
                ypos: parent.height * 4/10
                file: "qrc:///images/koala1.jpg"
                imgwidth: parent.width * 2/30
                number: 1
                doordate: "20171201" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 15/30
                ypos: parent.height * 4/10
                file: "qrc:///images/chipmunk.jpg"
                imgwidth: parent.width * 2/30
                number: 2
                doordate: "20171202"  // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 1/30
                ypos: parent.height * 3/20
                file: "qrc:///images/fox.jpg"
                imgwidth: parent.width * 2/30
                number: 3
                doordate: "20171203" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 25/30
                ypos: parent.height * 5/10
                file: "qrc:///images/piglet.jpg"
                imgwidth: parent.width * 2/30
                number: 4
                doordate: "20171204" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 2/30
                ypos: parent.height * 15/20
                file: "qrc:///images/jiraffe.jpg"
                imgwidth: parent.width * 2/30
                number: 5
                doordate: "20171205" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 6/30
                ypos: parent.height * 1/20
                file: "qrc:///images/elephant.jpg"
                imgwidth: parent.width * 2/30
                number: 6
                doordate: "20171206" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 20/30
                ypos: parent.height * 7/10
                file: "qrc:///images/meerkat.jpg"
                imgwidth: parent.width * 2/30
                number: 7
                doordate: "20171207" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 18/30
                ypos: parent.height * 2/10
                file: "qrc:///images/hedgehog.jpg"
                imgwidth: parent.width * 2/30
                number: 8
                doordate: "20171208" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 2/30
                ypos: parent.height * 4/10
                file: "qrc:///images/two-cute-lambs.jpg"
                imgwidth: parent.width * 2/30
                number: 9
                doordate: "20171209" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 12/30
                ypos: parent.height * 8/10
                file: "qrc:///images/llama.jpg"
                imgwidth: parent.width * 2/30
                number: 10
                doordate: "20171210" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 11/30
                ypos: parent.height * 3/10
                file: "qrc:///images/rabbits.jpg"
                imgwidth: parent.width * 2/30
                number: 11
                doordate: "20171211" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 26/30
                ypos: parent.height * 17/20
                file: "qrc:///images/wombat.jpg"
                imgwidth: parent.width * 2/30
                number: 12
                doordate: "20171212" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 5/30
                ypos: parent.height * 8/10
                file: "qrc:///images/panda.jpg"
                imgwidth: parent.width * 2/30
                number: 13
                doordate: "20171213" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 9/30
                ypos: parent.height * 1/10
                file: "qrc:///images/rhino.jpg"
                imgwidth: parent.width * 2/30
                number: 14
                doordate: "20171214" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 20/30
                ypos: parent.height * 9/20
                file: "qrc:///images/squirrel.jpg"
                imgwidth: parent.width * 2/30
                number: 15
                doordate: "20171215" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 3/30
                ypos: parent.height * 6/10
                file: "qrc:///images/anteater.jpg"
                imgwidth: parent.width * 2/30
                number: 16
                doordate: "20171216" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 13/30
                ypos: parent.height * 3/20
                file: "qrc:///images/alpaca.jpg"
                imgwidth: parent.width * 2/30
                number: 17
                doordate: "20171217" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 17/30
                ypos: parent.height * 11/20
                file: "qrc:///images/chick.jpg"
                imgwidth: parent.width * 2/30
                number: 18
                doordate: "20171218" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 21/30
                ypos: parent.height * 1/20
                file: "qrc:///images/kitten.jpg"
                imgwidth: parent.width * 2/30
                number: 19
                doordate: "20171219" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 24/30
                ypos: parent.height * 3/10
                file: "qrc:///images/deer.jpg"
                imgwidth: parent.width * 2/30
                number: 20
                doordate: "20171220" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 24/30
                ypos: parent.height * 15/20
                file: "qrc:///images/polarbear.jpg"
                imgwidth: parent.width * 2/30
                number: 21
                doordate: "20171221" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 9/30
                ypos: parent.height * 17/20
                file: "qrc:///images/penguins.jpg"
                imgwidth: parent.width * 2/30
                number: 22
                doordate: "20171222" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 16/30
                ypos: parent.height * 8/10
                file: "qrc:///images/seal.jpg"
                imgwidth: parent.width * 2/30
                number: 23
                doordate: "20171223" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
            Door {
                xpos: parent.width * 10/30
                ypos: parent.height * 11/20
                file: "qrc:///images/puppies.jpg"
                imgwidth: parent.width * 4/30
                number: 24
                doordate: "20171224" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
        }
    }
    /* The exit button! */
    Rectangle {
        id: quitbutton
        width: Math.min(mainwin.width/8, mainwin.height/8)
        height: width
        radius: width/5
        anchors.top: parent.top
        anchors.right: parent.right
        color: "grey"
        opacity: 0.4

        Text {
            text: qsTr("X")
            anchors.centerIn: parent
            font.bold: true
            font.pixelSize: parent.width*9/10
            color: "black"
            opacity: 1
        }
        MouseArea{
            anchors.fill: parent
            onPressed: Qt.quit()
        }
    }

}
