import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import TCP 1.0
import QtQuick.Dialogs 1.2

Window {
    width: 270
    height: 570
    visible: true
    title: qsTr("Hello World")

    //QML 코드
    StackView{
        id:stackView
        anchors.fill: parent

        initialItem: login

        // 시작 페이지
        Login {
            id : login
        }
    }

    Component{
        id : join

        Join {}
    }

    Component{
        id : main_page

        MainPage {}
    }

    // C++ 코드
    TCP{
        id :_tcp
        onLoginStatus : {
            if(msg == "1")
                stackView.push("qrc:/MainPage.qml")
        }

        onAccountStatus: {
            if(msg == "1")
                stackView.push("qrc:/Login.qml")
        }
    }

    Popup{
        id:popup
        width: parent.width/2
        height: parent.height/6
        anchors.centerIn: parent
        Text{
            id:title
            anchors.horizontalCenter: parent
            anchors.top: parent.top
            text: "로그아웃 하실?"
        }
        Button{
            height: 50
            width: parent.width/2-10
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.bottom: parent.bottom
            text: "OK"
            onClicked:{
                _tcp._write("exit/");
                Qt.quit();
            }

        }
        Button{
            height: 50
            width: parent.width/2-10
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.bottom: parent.bottom
            text: "Cancel"
            onClicked:{
                popup.close();
            }
        }

    }


    // 뒤로 가기 버튼
    Component.onCompleted: {
        // Connect to `released` signal and dispatch to `back()`
        contentItem.Keys.released.connect(function(event) {
            if (event.key === Qt.Key_Back) {
                event.accepted = true;
                console.log("************ " + stackView.currentItem.pageName);

                if(stackView.currentItem.pageName === "mainPage"){
                    popup.open();
                }else if(stackView.currentItem.pageName === "loginPage"){
                    _tcp._write("exit/");
                    Qt.quit();
                }else if(stackView.currentItem.pageName !== "answerSheet"){
                    stackView.pop();
                }else{
                    stackView.pop();
                    stackView.pop();

                }
            }
        })
    }
}
