//author:ranleixin
import QtQuick
import QtQuick.Controls 2.0
//添加棋盘图片
Image {
    id: chessboard
    parent: root
    z:5
    property double lastX:-1
    property double lastY:-1
    property int sequence: 0   //实现回合制，走一步加一
    property bool selected:false  //表示被选中，实现棋子的移动
    source: "qrc:/images/map.png"
    anchors.centerIn: parent
    //初始化棋子
    function initAnimalData(Animal,x,y)
        {
            Animal.x=x
            Animal.y=y
            Animal.z=6
            Animal.lastX=-1
            Animal.lastY=-1
            Animal.selected=false
            Animal.visible=true

        }//初始化棋盘
        function initChessboardData(Chessboard)
        {
            Chessboard.z=5
            Chessboard.lastY=-1
            Chessboard.lastX=-1
            Chessboard.sequence=0
            Chessboard.selected=false
        }
    //棋局结束重新开始初始化棋盘和棋子
    function init(Chessboard){

        initAnimalData(mouse_red,0,200)
        initAnimalData(cat_red,500,100)
        initAnimalData(dog_red,100,100)
        initAnimalData(wolf_red,400,200)
        initAnimalData(leopard_red,200,200)
        initAnimalData(tiger_red,600,0)
        initAnimalData(lion_red,0,0)
        initAnimalData(elephant_red,600,200)
        initAnimalData(mouse_blue,600,600)
        initAnimalData(cat_blue,100,700)
        initAnimalData(dog_blue,500,700)
        initAnimalData(wolf_blue,200,600)
        initAnimalData(leopard_blue,400,600)
        initAnimalData(tiger_blue,0,800)
        initAnimalData(lion_blue,600,800)
        initAnimalData(elephant_blue,0,600)
        initChessboardData(Chessboard)
    }//判断回合
    function whitchactar(Animals,Chessboard){
        var a=(Math.floor(handler.point.position.x/100)*100)
        var b=(Math.floor(handler.point.position.y/100)*100)
        //判断回合红方只能在chessboard.sequence%2=0的情况下移动，反之蓝方只能在chessboard.sequence%2=1的情况下移动，其他情况不能移动;以及判断己方棋子进入己方巢穴
        if(Chessboard.sequence%2==0&&Animals.actar===false)
        {Chessboard.selected=false
            Animals.selected=false
        }else if(Chessboard.sequence%2==1&&Animals.actar===true){
            chessboard.selected=false
            Animals.selected=false
        }else if(Animals.actar&&a===300&&b===0){
            Chessboard.selected=false
            Animals.selected=false
        }else if(!Animals.actar&&a===300&&b===800){
            Chessboard.selected=false
            Animals.selected=false
        }
    }
    //判断胜利，棋子进入对方巢穴，或者一方没有棋子了
    function vectory(Chessboard){
        if(Chessboard.isvectory(mouse_red)||Chessboard.isvectory(cat_red)||Chessboard.isvectory(dog_red)||Chessboard.isvectory(wolf_red)||Chessboard.isvectory(leopard_red)||Chessboard.isvectory(tiger_red)||Chessboard.isvectory(lion_red)||Chessboard.isvectory(elephant_red)||(!mouse_blue.visible&&!cat_blue.visible&&!dog_blue.visible&&!wolf_blue.visible&&!leopard_blue.visible&&!tiger_blue.visible&&!lion_blue.visible&&!elephant_blue.visible)){
            lose_bg.visible=true
            console.log("Congratulations the red_player win!!!")
        }else if(Chessboard.isvectory(mouse_blue)||Chessboard.isvectory(cat_blue)||Chessboard.isvectory(dog_blue)||Chessboard.isvectory(wolf_blue)||Chessboard.isvectory(leopard_blue)||Chessboard.isvectory(tiger_blue)||Chessboard.isvectory(lion_blue)||Chessboard.isvectory(elephant_blue)||(!mouse_red.visible&&!cat_red.visible&&!dog_red.visible&&!wolf_red.visible&&!leopard_red.visible&&!tiger_red.visible&&!lion_red.visible&&!elephant_red.visible)){
            win_bg.visible=true
            console.log("Congratulations the blue_player win!!!")
        }else{
      console.log("continnue")
        }
    }//判断胜利，棋子是否进入对方巢穴
    function isvectory(actar1){
              //red_actar win
        if(actar1.actar){
            if(actar1.lastX===350&&actar1.lastY===850){
             return true
                    }
            else{
                return false
            }
        }else{
            if((actar1.lastX===350&&actar1.lastY===50)){
                //blue_actar win
                return true
            }
            else
                return false
        }
    }
    //判断虎狮是否能跳河
    function isinRiver(Animals,mouses,a){
        if(isRiver(mouses)){
            if(Animals.lastX===mouses.lastX){
                return false
            }
            else if(Animals.lastY===mouses.lastY){
                //左边水池第一排有老鼠
                if(mouses.lastY===350&&(mouses.lastX===150||mouses.lastX===250)){
                    if(Animals.lastX===50){
                        return true
                    }else if(Animals.lastX===350&&a===50){
                        return true
                    }else if(Animals.lastX===350&&a===650){
                        return false
                    }else if(Animals.lastX===650){
                        return false
                    }
                }//右边水池第一排有老鼠
                else if(mouses.lastY===350&&(mouses.lastX===450||mouses.lastX===550)){
                    if(Animals.lastX===50){
                        return false
                    }else if(Animals.lastX===350&&a===50){
                        return false
                    }else if(Animals.lastX===350&&a===650){
                        return true
                    }else if(Animals.lastX===650){
                        return true
                    }
                }//左边水池第二排有老鼠
                else if(mouses.lastY===450&&(mouses.lastX===150||mouses.lastX===250)){
                    if(Animals.lastX===50){
                        return true
                    }else if(Animals.lastX===350&&a===50){
                        return true
                    }else if(Animals.lastX===350&&a===650){
                        return false
                    }else if(Animals.lastX===650){
                        return false
                    }
                }//右边水池第二排有老鼠
                else if(mouses.lastY===450&&(mouses.lastX===450||mouses.lastX===550)){
                    if(Animals.lastX===50){
                        return false
                    }else if(Animals.lastX===350&&a===50){
                        return false
                    }else if(Animals.lastX===350&&a===650){
                        return true
                    }else if(Animals.lastX===650){
                        return true
                    }
                }
                //左边水池第三排有老鼠
                else if(mouses.lastY===550&&(mouses.lastX===150||mouses.lastX===250)){
                    if(Animals.lastX===50){
                          return true
                    }else if(Animals.lastX===350&&a===50){
                          return true
                    }else if(Animals.lastX===350&&a===650){
                          return false
                    }else if(Animals.lastX===650){
                           return false
                    }
                }//右边水池第三排有老鼠
                else if(mouses.lastY===550&&(mouses.lastX===450||mouses.lastX===650)){
                    if(Animals.lastX===50){
                        return false
                    }else if(Animals.lastX===350&&a===50){
                        return false
                    }else if(Animals.lastX===350&&a===650){
                        return true
                    }else if(Animals.lastX===650){
                        return true
                    }
                }
            }
        }
        else
            return false
    }
    //判断老鼠是否在河里
    function isRiver(mouses){
        if(((mouses.lastX===150&&(mouses.lastY===350||mouses.lastY===450||mouses.lastY===550))||(mouses.lastX===250&&(mouses.lastY===350||mouses.lastY===450||mouses.lastY===550))||(mouses.lastX===450&&(mouses.lastY===350||mouses.lastY===450||mouses.lastY===550))||(mouses.lastX===550&&(mouses.lastY===350||mouses.lastY===450||mouses.lastY===550)))){
        return true
        }
        else
            return false
    }
    //提取eat中重复的代码
    function eating(parent,Animals,cx,cy,Chessboard){
        parent.visible=false
        Animals.x+=cx
        Animals.y+=cy
        Animals.lastX=Animals.x+50
        Animals.lastY=Animals.y+50
        parent.selected=false
        Animals.selected=false
        //实现回合制，走一步加一
        Chessboard.sequence+=1
        //每发生一次吃事件判断一次胜利
        chessboard.vectory(Chessboard)
        Chessboard.selected=false

    }
    //eat函数实现棋子的吃
    function eat(parent,Animals,Chessboard){
        //鼠标点击位置的左上角坐标
        var b=(Math.floor(parent.x/100)*100)
        var c=(Math.floor(parent.y/100)*100)
        //判断回合红方只能在chessboard.sequence%2=0的情况下移动，反之蓝方只能在chessboard.sequence%2=1的情况下移动，其他情况不能移动
        whitchactar(Animals,Chessboard)
        //横跳的时候，鼠标点击棋子的中心点横坐标距离
        var a=(Math.floor(parent.x/100)*100)+50
        //鼠标点击方格距离棋子的横坐标距离，竖坐标距离
        var cx=(Math.floor(parent.x/100)*100)+50-Animals.lastX
        var cy=(Math.floor(parent.y/100)*100)+50-Animals.lastY

        //首先判断棋子是否为同一类型
                if(parent.type!==Animals.type&&parent.selected&&Animals.selected){
                    //不为同一类型大吃小且不是大象吃老鼠
                    if(parent.type<Animals.type&&(parent.type!==1||Animals.type!==8)){
                        //陆地上位移为100的吃
                        if(((Math.abs(cx)==100&&Math.abs(cy)==0)||(Math.abs(cy)==100&&Math.abs(cx)==0))){
//                                parent.visible=false
                            eating(parent,Animals,cx,cy,Chessboard)
                    }   //虎狮跳河
                        else if((Animals.type===6||Animals.type===7)){
                            if(((Animals.lastY===250&&(Animals.lastX===150||Animals.lastX===250||Animals.lastX===450||Animals.lastX===550))||(Animals.lastY===650&&(Animals.lastX===150||Animals.lastX===250||Animals.lastX===450||Animals.lastX===550)))){
                                //特定几个坐标只能竖着跳
                               if((Math.abs(cy)==400&&Math.abs(cx)==0)&&(Chessboard.isinRiver(Animals,mouse_blue,a)===false&&Chessboard.isinRiver(Animals,mouse_red,a)===false)){
                                   eating(parent,Animals,cx,cy,Chessboard)
                                }//陆地上移动
                               else if(((Math.abs(cx)==100&&Math.abs(cy)==0)||(Math.abs(cy)==100&&Math.abs(cx)==0))){
                                   eating(parent,Animals,cx,cy,Chessboard)
                                }
                                else{
                                    Animals.selected=false
                                }
                            }else
                            {//特定几个坐标这能横着跳
                                if((Math.abs(cx)==300&&Math.abs(cy)==0)&&(Chessboard.isinRiver(Animals,mouse_blue,a)===false&&Chessboard.isinRiver(Animals,mouse_red,a)===false)){
                                   eating(parent,Animals,cx,cy,Chessboard)
                            }//陆地上移动
                                else if(((Math.abs(cx)==100&&Math.abs(cy)==0)||(Math.abs(cy)==100&&Math.abs(cx)==0))){
                                    eating(parent,Animals,cx,cy,Chessboard)
                                }
                                else{
                                    Animals.selected=false
                                }
                            }
                    }
                    }  //大象只能吃陷阱中的老鼠
                    else if(parent.type<Animals.type&&(parent.type===1&&Animals.type===8)&&((parent.lastX===250&&parent.lastY===50)||(parent.lastX===350&&parent.lastY===150)||(parent.lastX===450&&parent.lastY===50))){
                        //陆地上位移为100的吃
                        if(((Math.abs(cx)==100&&Math.abs(cy)==0)||(Math.abs(cy)==100&&Math.abs(cx)==0))){
                            eating(parent,Animals,cx,cy,Chessboard)
                    }else{
                            parent.selected=false
                            Animals.selected=false
                        }
                    }//不为同一类型小吃大
                    else if((parent.type>Animals.type)){
                        //只要蓝方棋子在红方陷阱，红方任意棋子都能吃掉该蓝方棋子
                        if(parent.actar===false&&((parent.lastX===250&&parent.lastY===50)||(parent.lastX===350&&parent.lastY===150)||(parent.lastX===450&&parent.lastY===50))){
                             //陆地上位移为100的吃
                            if((Math.abs(cx)==100&&Math.abs(cy)==0)||(Math.abs(cy)==100&&Math.abs(cx)==0)){
                                eating(parent,Animals,cx,cy,Chessboard)
                        }
                            //只要红方棋子在蓝方陷阱，蓝方任意棋子都能吃掉该红方棋子
                        }else if(parent.actar===true&&((parent.lastX===250&&parent.lastY===850)||(parent.lastX===350&&parent.lastY===750)||(parent.lastX===450&&parent.lastY===850))){
                            //陆地上位移为100的吃
                            if((Math.abs(cx)==100&&Math.abs(cy)==0)||(Math.abs(cy)==100&&Math.abs(cx)==0)){
                                eating(parent,Animals,cx,cy,Chessboard)
                        }
                          else{
                                parent.selected=false
                                Animals.selected=false
                            }
                            }
                        //老鼠是位移能直接吃大象的
                        else if(Animals.type===1&&parent.type===8){
                            //判断是位移否为100且老鼠在水中不能直接吃大象，必须先上岸
                            if(((Math.abs(cx)==100&&Math.abs(cy)==0)||(Math.abs(cy)==100&&Math.abs(cx)==0))&&!isRiver(Animals)){
                                eating(parent,Animals,cx,cy,Chessboard)
                        }
                          else{
                                parent.selected=false
                                Animals.selected=false
                            }
                        }
                        else{
                            parent.selected=false
                            Animals.selected=false
                        }
                    }
                }
            else{//相同动物的互吃
                    if(Animals.selected&&parent.selected){

                    if(((Math.abs(cx)==100&&Math.abs(cy)==0)||(Math.abs(cy)==100&&Math.abs(cx)==0))){//陆地上
                    if(Animals.lastX!==-1&&Animals.lastY!==-1)
                        eating(parent,Animals,cx,cy,Chessboard)
                    }//虎狮跳河
                    else if((Animals.type===6||Animals.type===7)){
                        if(((Animals.lastY===250&&(Animals.lastX===150||Animals.lastX===250||Animals.lastX===450||Animals.lastX===550))||(Animals.lastY===650&&(Animals.lastX===150||Animals.lastX===250||Animals.lastX===450||Animals.lastX===550)))){
                            //特定几个坐标只能竖着跳
                           if((Math.abs(dy)==400&&Math.abs(dx)==0)&&(Chessboard.isinRiver(Animals,mouse_blue,a)===false&&Chessboard.isinRiver(Animals,mouse_red,a)===false)){
                               eating(parent,Animals,cx,cy,Chessboard)
                            }//陆地上移动
                           else if(((Math.abs(cx)==100&&Math.abs(cy)==0)||(Math.abs(cy)==100&&Math.abs(cx)==0))){
                               eating(parent,Animals,cx,cy,Chessboard)
                            }
                            else{
                                Animals.selected=false
                            }
                        }else
                        {//特定几个坐标这能横着跳
                            if((Math.abs(cx)==300&&Math.abs(cy)==0)&&(Chessboard.isinRiver(Animals,mouse_blue,a)===false&&Chessboard.isinRiver(Animals,mouse_red,a)===false)){
                               eating(parent,Animals,cx,cy,Chessboard)
                        }//陆地上移动
                            else if(((Math.abs(cx)==100&&Math.abs(cy)==0)||(Math.abs(cy)==100&&Math.abs(cx)==0))){
                                eating(parent,Animals,cx,cy,Chessboard)
                            }
                            else{
                                Animals.selected=false
                            }
                        }
                    }
                }
        }
    }
    //提取calculate中重复代码
    function caculating(Animals,dx,dy,Chessboard){
        Animals.x+=dx
        Animals.y+=dy
        Animals.lastX=Animals.x+50
        Animals.lastY=Animals.y+50
        Animals.selected=false
        //实现回合制，走一步加一
        Chessboard.sequence+=1
        //每实现一次棋子的移动判断一次胜利
        Chessboard.vectory(Chessboard)
        Chessboard.selected=false
    }
    //实现棋子移动事件
    function caculate(Animals,Chessboard){
        //鼠标点击位置的左上角坐标
        var a=(Math.floor(handler.point.position.x/100)*100)
        var b=(Math.floor(handler.point.position.y/100)*100)
         Chessboard.whitchactar(Animals,Chessboard)
        var c=a+50
        //鼠标点击方格距离棋子的横坐标距离，竖坐标距离
        var dx=a+50-Animals.lastX
        var dy=b+50-Animals.lastY
        //解决taphandler事件穿透
        if(Animals.selected===true&&Chessboard.selected===true)
        {
            if((Math.abs(dx)==100&&dy==0)||(dx==0&&Math.abs(dy)==100)){
                Chessboard.selected=true
            }else if((Math.abs(dx)==300&&dy==0)&&(((Animals.lastX===50&&(Animals.lastY===350||Animals.lastY===450||Animals.lastY===550))||(Animals.lastX===350&&(Animals.lastY===350||Animals.lastY===450||Animals.lastY===550))||(Animals.lastX===650&&(Animals.lastY===350||Animals.lastY===450||Animals.lastY===550))))){
                Chessboard.selected=true
            }else if((Math.abs(dy)==400&&dx==0)&&((Animals.lastY===250&&(Animals.lastX===150||Animals.lastX===250||Animals.lastX===450||Animals.lastX===550))||(Animals.lastY===650&&(Animals.lastX===150||Animals.lastX===250||Animals.lastX===450||Animals.lastX===550)))){
                Chessboard.selected=true
            }else{
                Chessboard.selected=false
                return 1
            }
        }else{
             Chessboard.selected=false
            return 1
        }
        //判断回合红方只能在chessboard.sequence%2=0的情况下移动，反之蓝方只能在chessboard.sequence%2=1的情况下移动，其他情况不能移动

        //老鼠的情况
        if(Animals.type===1){
            if(Animals.selected&&Chessboard.selected){
                if((Math.abs(dx)==100&&Math.abs(dy)==0)||(Math.abs(dy)==100&&Math.abs(dx)==0)){

                    Chessboard.caculating(Animals,dx,dy,Chessboard)
            }else{
                    Animals.selected=false
                }
            }
            else{
                Animals.selected=false
            }
        }
        //虎狮跳河
        else if((Animals.type===6||Animals.type===7)&&Animals.selected&&Chessboard.selected){
        //特定几个坐标只能竖着跳
            if(((Animals.lastY===250&&(Animals.lastX===150||Animals.lastX===250||Animals.lastX===450||Animals.lastX===550))||(Animals.lastY===650&&(Animals.lastX===150||Animals.lastX===250||Animals.lastX===450||Animals.lastX===550)))){
               if((Math.abs(dy)==400&&Math.abs(dx)==0)&&(Chessboard.isinRiver(Animals,mouse_blue,c)===false&&Chessboard.isinRiver(Animals,mouse_red,c)===false)){
                   Chessboard.caculating(Animals,dx,dy,Chessboard)
                }//陆地上移动
               else if(((Math.abs(dx)==100&&Math.abs(dy)==0)||(Math.abs(dy)==100&&Math.abs(dx)==0))){
                    Chessboard.caculating(Animals,dx,dy,Chessboard)
                }
                else{
                    Animals.selected=false
                }
            }
            else if(((Animals.lastY===350&&(Animals.lastX===50||Animals.lastX===350||Animals.lastX===650))||(Animals.lastY===450&&(Animals.lastX===50||Animals.lastX===350||Animals.lastX===650))||(Animals.lastY===550&&(Animals.lastX===50||Animals.lastX===350||Animals.lastX===650))))
            {//特定几个坐标这能横着跳
                if((Math.abs(dx)==300&&Math.abs(dy)==0)&&(Chessboard.isinRiver(Animals,mouse_blue,c)===false&&Chessboard.isinRiver(Animals,mouse_red,c)===false)){
                        Chessboard.caculating(Animals,dx,dy,Chessboard)
            }//陆地上移动
                else if(((Math.abs(dx)==100&&Math.abs(dy)==0)||(Math.abs(dy)==100&&Math.abs(dx)==0))){
                    Chessboard.caculating(Animals,dx,dy,Chessboard)
                }
                else{
                    Animals.selected=false
                }

            }else{
                //陆地上移动
                                if(((Math.abs(dx)==100&&Math.abs(dy)==0)||(Math.abs(dy)==100&&Math.abs(dx)==0))){
                                    Chessboard.caculating(Animals,dx,dy,Chessboard)
                                }
                                else{
                                    Animals.selected=false
                                }
            }

    }
        //只有老鼠能下河
        else if(Animals.selected&&Chessboard.selected&&(Animals.type!==1&&Animals.type!==6&&Animals.type!==7)){
            if((b==300&&a==100)||(b==300&&a==200)||(a==100&&b==400)||(a==200&&b==400)||(a==100&&b==500)||(a==200&&b==500)||(a==400&&b==300)||(a==500&&b==300)||(a==400&&b==400)||(a==500&&b==400)||(a==400&&b==500)||(a==500&&b==500)) {
                Animals.selected=false
                Chessboard.selected=false
            }
            //除了河的陆地都能走
            else{

                    if((Math.abs(dx)==100&&Math.abs(dy)==0)||(Math.abs(dy)==100&&Math.abs(dx)==0)){
                        Chessboard.caculating(Animals,dx,dy,Chessboard)
                    }
                    else{
                        Animals.selected=false
                    }
                }
            }
        }


    }



