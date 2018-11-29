import QtQuick 2.0

Item {
    ListModel {
        ListElement{
            Door {
                xpos: parent.width * 2/10
                ypos: parent.height * 4/10
                file: "qrc:///images/koala1.jpg"
                imgwidth: parent.width * 2/20
                number: 1
                doordate: "20171129" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
        }
        ListElement {
            Door {
                xpos: parent.width * 5/10
                ypos: parent.height * 4/10
                file: "qrc:///images/koala1.jpg"
                imgwidth: parent.width * 2/20
                number: 2
                doordate: "20171130" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
        }
        ListElement{
            Door {
                xpos: parent.width * 7/10
                ypos: parent.height * 4/10
                file: "qrc:///images/koala1.jpg"
                imgwidth: parent.width * 2/20
                number: 3
                doordate: "20171129" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
        }
        ListElement {
            Door {
                xpos: parent.width * 5/10
                ypos: parent.height * 7/10
                file: "qrc:///images/koala1.jpg"
                imgwidth: parent.width * 2/20
                number: 4
                doordate: "20171130" // The date at which the door can be opened
                isopen: datastore.isopen(number)
            }
        }
    }
}
