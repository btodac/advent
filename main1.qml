import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0


/* This is the the advent calender for android 2017! */
Window {
    id: main
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
/* Black background for when the image cant fill the screen */
    Rectangle{
        id: canvas1
        width: main.width
        height: main.height
        anchors.centerIn: parent
        color: "#000000"
    }
// Th background image which scales with the window while preserving aspect ratio
    Image {
        id: background
        source: "qrc:///images/baseimage.jpg"
        fillMode: Image.PreserveAspectFit
        width: main.width //* 6/5
        anchors.centerIn: parent
// The image beghind the 1st door which scales and moves with the background image
        Image {
            id: door1
            fillMode: Image.PreserveAspectFit
            source: "qrc:///images/koala1.jpg"
            width: background.width * 1/10
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: background.width * 1/10
            anchors.topMargin: background.height * 1/10
        }
// The door which scales and moves with the background and also rotates about the y axis for the "door openeing effect"
        Rectangle{
            clip: true
            Image {
                id: door2
                //fillMode: Image.PreserveAspectCrop
                source: "qrc:///images/baseimage.jpg"
                fillMode: Image.PreserveAspectFit
                width: main.width //* 6/5
                //width: background.width * 1/10
                //height: door1.height
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: background.width * 1/10
                anchors.topMargin: background.height * 1/10
                transform:
                    Rotation {
                    origin.x: 0
                    origin.y: 30
                    axis { x: 0; y: 1; z: 0 }
                    angle: 0
                        NumberAnimation on angle {
                            duration: 2000
                            from: 0
                            to: -90
                            loops: 100
                        }
                    }

            }
        }
    }
}
