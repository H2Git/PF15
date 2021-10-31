import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Timeline 1.0
import QtQuick.Controls.Material 2.3

Item {
    //objectName:"mainPage"
    property double _width: width / 270
    property double _height: height / 570
    property string pageName: "mainPage"
    id: page1
    anchors.fill: parent
    width: 270
    height: 570

    Text {
        id: title
        text: qsTr("난 이 도")
        horizontalAlignment: Texwkft.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        font.pointSize: 25

        y: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Button {
        id: button
        y: 150
        width: 200
        height: 100
        visible: true
        text: qsTr("상")

        onClicked: {
            _tcp._RecvQuestionList("start/3");

            stackView.push("qrc:/Stage1.qml",{text1: "상급"})
        }

        anchors.horizontalCenter: parent.horizontalCenter

    }

    Button {
        id: button1
        width: 200
        height: 100
        visible: true
        text: qsTr("중")
        anchors.top: button.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        onClicked: {
            _tcp._RecvQuestionList("start/2");
            stackView.push("qrc:/Stage1.qml",{text1: "중급"})
        }
    }

    Button {
        id: button2
        width: 200
        height: 100
        visible: true
        text: qsTr("하")
        anchors.top: button1.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        onClicked: {
            _tcp._RecvQuestionList("start/1");
            stackView.push("qrc:/Stage1.qml",{text1: "하급"})
        }
    }

    Button {
        id: button3
        width: 200
        height: 100
        visible: true
        text: qsTr("랭킹")
        anchors.top: button2.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        onClicked: {
            _tcp._write("ranking/");

            stackView.push("qrc:/Rank.qml")
        }
    }



}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
