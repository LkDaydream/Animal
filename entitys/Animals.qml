import QtQuick

//动物基础属性以及动物的图片
Item {
    id:root
    z:6
    property bool selected:false //判断棋子是否被选中
    property int type //棋子的类型，由于判断级别大的吃掉小的
    property bool actar //玩家的类型，区分true为红方和false为蓝方
    property double lastX:-1 //记录当前位置的中心点x坐标
    property double lastY:-1 //记录当前位置的中心点y坐标
    Image{
        anchors.fill: parent
        //根据棋子类型和玩家类型分配棋子
        source: {
            if(actar)
            {
                switch(type){
                case 1: return "qrc:/images/mouse_red.png"
                case 2: return "qrc:/images/cat_red.png"
                case 3: return "qrc:/images/dog_red.png"
                case 4: return "qrc:/images/wolf_red.png"
                case 5: return "qrc:/images/leopard_red.png"
                case 6: return "qrc:/images/tiger_red.png"
                case 7: return "qrc:/images/lion_red.png"
                case 8: return "qrc:/images/elephant_red.png"
                }
            }
            else {
                switch(type){
                case 1: return "qrc:/images/mouse_blue.png"
                case 2: return "qrc:/images/cat_blue.png"
                case 3: return "qrc:/images/dog_blue.png"
                case 4: return "qrc:/images/wolf_blue.png"
                case 5: return "qrc:/images/leopard_blue.png"
                case 6: return "qrc:/images/tiger_blue.png"
                case 7: return "qrc:/images/lion_blue.png"
                case 8: return "qrc:/images/elephant_blue.png"
               }
            }
         }



    }
}

