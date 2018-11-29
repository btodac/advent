import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtSensors 5.3

/* Needs smart phone abilities, sliding/zooming/tapping, and door unlocks based on date! */
/* This is the the advent calender for android 2017! */
Window {
    id: mainwin
    visible: true
    maximumWidth: 1900
    maximumHeight: 1280
    title: qsTr("Advent Calender 2017")
    property var locale: Qt.locale()
    property string today: new Date().toLocaleString(locale, "yyyyMMdd")
    //property var datestrings: today.split(".")
    Flickable {
        id: flicker
        anchors.fill: parent
        PinchArea{
            width: mainwin.width
            height: mainwin.height
            property real initwidth
            property real initheight
            onPinchStarted: {
                initwidth = flicker.width
                initheight = flicker.height
            }

            onPinchUpdated: {
                // adjust content pos due to drag
                //flicker.contentX += pinch.previousCenter.x - pinch.center.x
                //flicker.contentY += pinch.previousCenter.y - pinch.center.y

                // resize content
                flicker.resizeContent(initwidth * pinch.scale, initheight * pinch.scale, pinch.center)
            }

            onPinchFinished: {
                // Move its content within bounds.
                flicker.returnToBounds()
            }
        }

    /* Black background for when the image cant fill the screen */
        Rectangle{
            id: canvas1
            width: mainwin.width
            height: mainwin.height
            anchors.centerIn: parent
            color: "#000000"
        }
    // Th background image which scales with the window while preserving aspect ratio
        Image {
            id: background
            source: "qrc:///images/baseimage.jpg"
            fillMode: Image.PreserveAspectFit
            width: mainwin.width //* 6/5
            anchors.centerIn: parent

            Door {
                id: door1
                xpos: background.width * 2/10
                ypos: background.height * 4/10
                file: "qrc:///images/koala1.jpg"
                imgwidth: background.width * 2/20

            }
        }
    }
}
