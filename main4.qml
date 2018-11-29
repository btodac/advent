import QtQuick 2.7
import QtQuick.Window 2.2

/* Needs smart phone abilities, sliding/zooming/tapping, and door unlocks based on date! */
/* This is the the advent calender for android 2017! */
Window {
    id: mainwin
    visible: true
    width: Screen.width
    height: Screen.height

    title: qsTr("Advent Calender 2017")
    property var locale: Qt.locale()
    property string today: new Date().toLocaleString(locale, "yyyyMMdd") // todays date
/* Black background for when the image cant fill the screen */
    Rectangle{
        id: canvas1
        anchors.fill: parent
        anchors.centerIn: parent
        color: "#000000"
    }
    // The background image which scales with the window while preserving aspect ratio
    Flickable {
        id: flick
        anchors.fill: parent
        contentWidth: background.width
        contentHeight: background.height
        boundsBehavior: Flickable.StopAtBounds

        PinchArea {
            id: pa
            width: Math.max(flick.contentWidth, flick.width)
            height: Math.max(flick.contentHeight, flick.height)
            property real initialWidth
            property real initialHeight
            property real newWidth
            property real newHeight
            pinch.minimumScale: 1
            pinch.maximumScale: 4
            onPinchStarted: {
                initialWidth = flick.contentWidth
                initialHeight = flick.contentHeight
            }

            onPinchUpdated: {
                newWidth = initialWidth * pinch.scale
                newHeight = initialHeight *pinch.scale
                // adjust content pos due to drag


                // resize content
                if ((newWidth < background.sourceSize.width)&&(newWidth > mainwin.width))
                {
                    background.width = newWidth
                    flick.contentX += pinch.previousCenter.x - pinch.center.x
                    flick.contentY += pinch.previousCenter.y - pinch.center.y
                }
            }

            onPinchFinished: {
                // Move its content within bounds.
                flick.returnToBounds()
            }
        }


        Image {
            id: background
            source: "qrc:///images/baseimage.jpg"
            fillMode: Image.PreserveAspectFit
            width: flick.width //* 6/5
            anchors.centerIn: parent
            // Door that opens only at specific date
            Door {
                id: door1
                xpos: parent.width * 2/10
                ypos: parent.height * 4/10
                file: "qrc:///images/koala1.jpg"
                imgwidth: parent.width * 2/20
            }
        }
    }

}
