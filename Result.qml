import QtQuick


    Image{
        //蓝方胜利背景图
        id:win_bg
        width: 620
        height: 1000
        property bool chessboardVisible: false
        anchors.centerIn: parent
        visible: false
        source: "qrc:/images/win.png"
        Image {
            //继续按钮
            id: game_continue

            width: 140
            height: 70
            x:100
            y:650
            source: "qrc:/images/continue.png"          
        }
        Image {
            //结束按钮
            id: game_end
            width: 140
            height: 70
            x:300
            y:650
            source: "qrc:/images/end.png"       
        }
    }

