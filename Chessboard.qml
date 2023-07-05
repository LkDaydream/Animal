//author:ranleixin

import QtQuick
import QtQuick.Controls 2.0
import "./entitys"
import "./actions"
//棋盘
Item {
    id:root
    width: 700;height: 900
    anchors.centerIn: parent //棋盘居中
    TapHandler{
        id:handler
        onTapped:{
            //点击棋盘使其被选中
            chessboard.selected=true


if(mouse_red.selected){
    //red老鼠移动
    chessboard.caculate(mouse_red,chessboard)
}else if(mouse_blue.selected){
    //blue老鼠移动
   chessboard.caculate(mouse_blue,chessboard)
 }else if(cat_red.selected){
    //cat_red移动
    chessboard.caculate(cat_red,chessboard)
}else if(cat_blue.selected){
    //cat_blue移动
    chessboard.caculate(cat_blue,chessboard)
}else if(dog_blue.selected){    //dog_blue
    chessboard.caculate(dog_blue,chessboard)
}else if(dog_red.selected){
    //dog_red
    chessboard.caculate(dog_red,chessboard)
}else if(wolf_blue.selected){
    //wolf_blue
    chessboard.caculate(wolf_blue,chessboard)
}else if(wolf_red.selected){
    //wolf_red
    chessboard.caculate(wolf_red,chessboard)
}else if(leopard_blue.selected){
    //leopard_blue
    chessboard.caculate(leopard_blue,chessboard)
}else if(leopard_red.selected){
    //leopard_red
    chessboard.caculate(leopard_red,chessboard)
}else if(tiger_blue.selected){
    //tiger_blue
    chessboard.caculate(tiger_blue,chessboard)
}else if(tiger_red.selected){
    //tiger_red
    chessboard.caculate(tiger_red,chessboard)
}else if(lion_blue.selected){
    //lion_blue
    chessboard.caculate(lion_blue,chessboard)
}else if(lion_red.selected){
    //lion_red
    chessboard.caculate(lion_red,chessboard)
}else if(elephant_blue.selected){
    //elephant_blue移动
    chessboard.caculate(elephant_blue,chessboard)
}else if(elephant_red.selected){
    //elephant_red移动
    chessboard.caculate(elephant_red,chessboard)
}else{

}

        }
        target: Chessmove{
            id:chessboard

        }
    }


//红鼠
        Animals{
            id: mouse_red
            type: 1
            actar: true
            x:0
            y:200
            width: 100
            height: 100
            Action{

            onTapped: {
//被吃
                chessboard.eat(mouse_red,mouse_blue,chessboard)
                chessboard.eat(mouse_red,cat_blue,chessboard)
                chessboard.eat(mouse_red,dog_blue,chessboard)
                chessboard.eat(mouse_red,wolf_blue,chessboard)
                chessboard.eat(mouse_red,leopard_blue,chessboard)
                chessboard.eat(mouse_red,tiger_blue,chessboard)
                chessboard.eat(mouse_red,lion_blue,chessboard)
                chessboard.eat(mouse_red,elephant_blue,chessboard)
            }
          }
        }
             //红猫
        Animals {
                id:cat_red
                x:500
                y:100
                width: 100
                height: 100
                actar: true
                type: 2
                Action{
                    onTapped: {//被吃
                        chessboard.eat(cat_red,mouse_blue,chessboard)
                        chessboard.eat(cat_red,cat_blue,chessboard)
                        chessboard.eat(cat_red,dog_blue,chessboard)
                        chessboard.eat(cat_red,wolf_blue,chessboard)
                        chessboard.eat(cat_red,leopard_blue,chessboard)
                        chessboard.eat(cat_red,tiger_blue,chessboard)
                        chessboard.eat(cat_red,lion_blue,chessboard)
                        chessboard.eat(cat_red,elephant_blue,chessboard)
                    }
                }
            }
             //红狗
            Animals{
                id:dog_red
                type: 3
                actar: true
                width: 100
                height: 100
                x:100
                y:100
                Action{
                    onTapped: {//被吃
                        chessboard.eat(dog_red,mouse_blue,chessboard)
                        chessboard.eat(dog_red,cat_blue,chessboard)
                        chessboard.eat(dog_red,dog_blue,chessboard)
                        chessboard.eat(dog_red,wolf_blue,chessboard)
                        chessboard.eat(dog_red,leopard_blue,chessboard)
                        chessboard.eat(dog_red,tiger_blue,chessboard)
                        chessboard.eat(dog_red,lion_blue,chessboard)
                        chessboard.eat(dog_red,elephant_blue,chessboard)
                    }}
            }
             //红狼
            Animals{
                id:wolf_red
                type: 4
                actar: true
                width: 100
                height: 100
                x:400
                y:200
                Action{
                    onTapped: {//被吃
                        chessboard.eat(wolf_red,mouse_blue,chessboard)
                        chessboard.eat(wolf_red,cat_blue,chessboard)
                        chessboard.eat(wolf_red,dog_blue,chessboard)
                        chessboard.eat(wolf_red,wolf_blue,chessboard)
                        chessboard.eat(wolf_red,leopard_blue,chessboard)
                        chessboard.eat(wolf_red,tiger_blue,chessboard)
                        chessboard.eat(wolf_red,lion_blue,chessboard)
                        chessboard.eat(wolf_red,elephant_blue,chessboard)
                    }
                }
            }
             //红豹
            Animals{
                id:leopard_red
                type: 5
                actar: true
                width: 100
                height: 100
                x:200
                y:200
                Action{
                    onTapped: {//被吃
                        chessboard.eat(leopard_red,mouse_blue,chessboard)
                        chessboard.eat(leopard_red,cat_blue,chessboard)
                        chessboard.eat(leopard_red,dog_red,chessboard)
                        chessboard.eat(leopard_red,wolf_blue,chessboard)
                        chessboard.eat(leopard_red,leopard_blue,chessboard)
                        chessboard.eat(leopard_red,tiger_blue,chessboard)
                        chessboard.eat(leopard_red,lion_blue,chessboard)
                        chessboard.eat(leopard_red,elephant_blue,chessboard)
                    }
                }
            }
             //红虎
            Animals{
                id:tiger_red
                type: 6
                actar: true
                width: 100
                height: 100
                x:600
                y:0
                Action{
                    onTapped: {//被吃
                        chessboard.eat(tiger_red,mouse_blue,chessboard)
                        chessboard.eat(tiger_red,cat_blue,chessboard)
                        chessboard.eat(tiger_red,dog_blue,chessboard)
                        chessboard.eat(tiger_red,wolf_blue,chessboard)
                        chessboard.eat(tiger_red,leopard_blue,chessboard)
                        chessboard.eat(tiger_red,tiger_blue,chessboard)
                        chessboard.eat(tiger_red,lion_blue,chessboard)
                        chessboard.eat(tiger_red,elephant_blue,chessboard)
                    }
                }
            }
             //红狮
            Animals{
                id:lion_red
                type: 7
                actar: true
                width: 100
                height: 100
                x:0
                y:0
                Action{
                   onTapped: {//被吃
                        chessboard.eat(lion_red,mouse_blue,chessboard)
                        chessboard.eat(lion_red,cat_blue,chessboard)
                        chessboard.eat(lion_red,dog_blue,chessboard)
                        chessboard.eat(lion_red,wolf_blue,chessboard)
                        chessboard.eat(lion_red,leopard_blue,chessboard)
                        chessboard.eat(lion_red,tiger_blue,chessboard)
                        chessboard.eat(lion_red,lion_blue,chessboard)
                        chessboard.eat(lion_red,elephant_blue,chessboard)
                    }
                }
            }
             //红象
            Animals{
                id:elephant_red
                type: 8
                actar: true
                width: 100
                height: 100
                x:600
                y:200
                Action{
                    onTapped: {//被吃
                        chessboard.eat(elephant_red,mouse_blue,chessboard)
                        chessboard.eat(elephant_red,cat_blue,chessboard)
                        chessboard.eat(elephant_red,dog_blue,chessboard)
                        chessboard.eat(elephant_red,wolf_blue,chessboard)
                        chessboard.eat(elephant_red,leopard_blue,chessboard)
                        chessboard.eat(elephant_red,tiger_blue,chessboard)
                        chessboard.eat(elephant_red,mouse_blue,chessboard)
                        chessboard.eat(elephant_red,elephant_blue,chessboard)
                    }
                }
            }
            //蓝鼠
             Animals{
                 id:mouse_blue
                 type: 1
                 actar: false
                 width: 100
                 height: 100
                 x:600
                 y:600
                 Action{
                     onTapped: {//被吃
                         chessboard.eat(mouse_blue,mouse_red,chessboard)
                         chessboard.eat(mouse_blue,cat_red,chessboard)
                         chessboard.eat(mouse_blue,dog_red,chessboard)
                         chessboard.eat(mouse_blue,wolf_red,chessboard)
                         chessboard.eat(mouse_blue,leopard_red,chessboard)
                         chessboard.eat(mouse_blue,tiger_red,chessboard)
                         chessboard.eat(mouse_blue,lion_red,chessboard)
                         chessboard.eat(mouse_blue,elephant_red,chessboard)

                     }
                 }
             }
             //蓝猫
                Animals{
                    id:cat_blue
                    type: 2
                    actar: false
                    width: 100
                    height: 100
                    x:100
                    y:700
                    Action{
                        onTapped: {//被吃
                            chessboard.eat(cat_blue,mouse_red,chessboard)
                            chessboard.eat(cat_blue,cat_red,chessboard)
                            chessboard.eat(cat_blue,dog_red,chessboard)
                            chessboard.eat(cat_blue,wolf_red,chessboard)
                            chessboard.eat(cat_blue,leopard_red,chessboard)
                            chessboard.eat(cat_blue,tiger_red,chessboard)
                            chessboard.eat(cat_blue,lion_red,chessboard)
                            chessboard.eat(cat_blue,elephant_red,chessboard)
                        }
                    }
                }
            //蓝狗
            Animals{
                id:dog_blue
                type: 3
                actar: false
                width: 100
                height: 100
                x:500
                y:700
                Action{
                    onTapped: {//被吃
                        chessboard.eat(dog_blue,mouse_red,chessboard)
                        chessboard.eat(dog_blue,cat_red,chessboard)
                        chessboard.eat(dog_blue,dog_red,chessboard)
                        chessboard.eat(dog_blue,wolf_red,chessboard)
                        chessboard.eat(dog_blue,leopard_red,chessboard)
                        chessboard.eat(dog_blue,tiger_red,chessboard)
                        chessboard.eat(dog_blue,lion_red,chessboard)
                        chessboard.eat(dog_blue,elephant_red,chessboard)
                    }
                }
            }
            //蓝狼
            Animals{
                id:wolf_blue
                type: 4
                actar: false
                width: 100
                height: 100
                x:200
                y:600
                Action{
                    onTapped: {//被吃
                        chessboard.eat(wolf_blue,mouse_red,chessboard)
                        chessboard.eat(wolf_blue,cat_red,chessboard)
                        chessboard.eat(wolf_blue,dog_red,chessboard)
                        chessboard.eat(wolf_blue,wolf_red,chessboard)
                        chessboard.eat(wolf_blue,leopard_red,chessboard)
                        chessboard.eat(wolf_blue,tiger_red,chessboard)
                        chessboard.eat(wolf_blue,lion_red,chessboard)
                        chessboard.eat(wolf_blue,elephant_red,chessboard)
                    }
                }
            }
            //蓝豹
            Animals{
                id:leopard_blue
                type: 5
                actar: false
                width: 100
                height: 100
                x:400
                y:600
                Action{
                    onTapped: {//被吃
                        chessboard.eat(leopard_blue,mouse_red,chessboard)
                        chessboard.eat(leopard_blue,cat_red,chessboard)
                        chessboard.eat(leopard_blue,dog_red,chessboard)
                        chessboard.eat(leopard_blue,wolf_red,chessboard)
                        chessboard.eat(leopard_blue,leopard_red,chessboard)
                        chessboard.eat(leopard_blue,tiger_red,chessboard)
                        chessboard.eat(leopard_blue,lion_red,chessboard)
                        chessboard.eat(leopard_blue,elephant_red,chessboard)
                    }
                }
            }
            //蓝虎
            Animals{
                id:tiger_blue
                type: 6
                actar: false
                width: 100
                height: 100
                x:0
                y:800
                Action{
                    onTapped: {//被吃
                        chessboard.eat(tiger_blue,mouse_red,chessboard)
                        chessboard.eat(tiger_blue,cat_red,chessboard)
                        chessboard.eat(tiger_blue,dog_red,chessboard)
                        chessboard.eat(tiger_blue,wolf_red,chessboard)
                        chessboard.eat(tiger_blue,leopard_red,chessboard)
                        chessboard.eat(tiger_blue,tiger_red,chessboard)
                        chessboard.eat(tiger_blue,lion_red,chessboard)
                        chessboard.eat(tiger_blue,elephant_red,chessboard)
                    }
                }
            }
            //蓝狮
            Animals{
                id:lion_blue
                type: 7
                actar: false
                width: 100
                height: 100
                x:600
                y:800
                Action{
                    onTapped: {//被吃
                        chessboard.eat(lion_blue,mouse_red,chessboard)
                        chessboard.eat(lion_blue,cat_red,chessboard)
                        chessboard.eat(lion_blue,dog_red,chessboard)
                        chessboard.eat(lion_blue,wolf_red,chessboard)
                        chessboard.eat(lion_blue,leopard_red,chessboard)
                        chessboard.eat(lion_blue,tiger_red,chessboard)
                        chessboard.eat(lion_blue,lion_red,chessboard)
                        chessboard.eat(lion_blue,elephant_red,chessboard)
                    }
                }
            }
            //蓝象
            Animals{
                id:elephant_blue
                type: 8
                actar: false
                width: 100
                height: 100
                x:0
                y:600
                Action{
                    onTapped: {//被吃
                        chessboard.eat(elephant_blue,mouse_red,chessboard)
                        chessboard.eat(elephant_blue,cat_red,chessboard)
                        chessboard.eat(elephant_blue,dog_red,chessboard)
                        chessboard.eat(elephant_blue,wolf_red,chessboard)
                        chessboard.eat(elephant_blue,leopard_red,chessboard)
                        chessboard.eat(elephant_blue,tiger_red,chessboard)
                        chessboard.eat(elephant_blue,mouse_red,chessboard)
                        chessboard.eat(elephant_blue,elephant_red,chessboard)
                    }
                }
            }
            Image{
                //蓝方胜利背景图
                id:win_bg
                z:7
                width: 620
                height: 1000
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
                    TapHandler{
                        onTapped: {
                            //继续便会初始化棋盘
                            win_bg.visible=false
                            chessboard.init()
                        }
                    }
                }
                Image {
                    //结束按钮
                    id: game_end
                    width: 140
                    height: 70
                    x:300
                    y:650
                    source: "qrc:/images/end.png"
                    TapHandler{
                        onTapped: {//退出游戏
                            Qt.quit()
                        }
                    }
                }
            }

            Image{
                //蓝方失败背景图
                id:lose_bg
                z:7
                width: 620
                height: 1000
                anchors.centerIn: parent
                visible: false
                source: "qrc:/images/lose.png"
                Image {
                    //继续按钮
                    id: game_continue1
                    width: 140
                    height: 70
                    x:100
                    y:650
                    source: "qrc:/images/continue.png"
                    TapHandler{
                        onTapped: {
                            //继续便会初始化棋盘
                            lose_bg.visible=false
                            chessboard.init()
                        }
                    }
                }
                Image {
                    //结束按钮
                    id: game_end1
                    width: 140
                    height: 70
                    x:300
                    y:650
                    source: "qrc:/images/end.png"
                    TapHandler{
                        onTapped: {
                            //退出游戏
                          Qt.quit()
                        }
                    }
                }
            }
            StartGame{
                //开始游戏界面
                id:start
                visible: false
            }



}

