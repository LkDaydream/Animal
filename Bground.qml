import QtQuick

//背景
Item{
        id:gameArea
        height: parent.height
        width: parent.width
        anchors.centerIn: parent
        //添加背景图片
        Image {
            id: background
            source: "qrc:/images/bg.png"
            anchors.centerIn: parent
            //绘制背景里的两个小人
            Image{
                id:player_red
                x:515
                y:30
                source: "qrc:/images/player_red.png"
            }
            Image{
                id:player_blue
                x:115
                y:1110
                source: "qrc:/images/player_blue.png"
            }
        }
}






