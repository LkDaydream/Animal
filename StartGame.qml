import QtQuick
import QtQuick.Dialogs
Image {//游戏开始背景图
      id: startBg
      z:8
      width: 700
      height: 1300
      anchors.centerIn: parent
      source: "qrc:/images/startBg.png"
      Image {//开始游戏按钮
          id: startGame
          y:500
          x:220
          width: 260
          height: 80
          source: "qrc:/images/startGame.png"
          TapHandler{
              id:stm
  acceptedDevices: PointerDevice.Mouse
              onTapped:{
                  startBg.visible=false
                  chessboard.init(chessboard)
                }
            }
        }
      Image {//退出游戏按钮
          id: exitGame
          y:600
          x:220
          width: 260
          height: 80
          source: "qrc:/images/exitGame.png"
          TapHandler{
                acceptedDevices: PointerDevice.Mouse
              onTapped:{
                  Qt.quit()
                }
            }
        }
      Image {//游戏规则按钮
          id: rule
          y:700
          x:220
          width: 260
          height: 80
          source: "qrc:/images/rule.png"
          TapHandler{
              id:rt
              onTapped:{

                  ruletext.visible=true
                }
            }
        }
      MessageDialog {//游戏规则弹窗
          id:ruletext
          visible: false
          buttons: MessageDialog.Ok
          text: "1.斗兽棋的棋盘横七列，纵九行，棋子放在格子中。双方底在线各有三个陷阱和一个兽穴
2.斗兽棋的棋子：斗兽棋棋子共十六个，分为红蓝双方，双方各有八只一样的棋子,按照战斗力强弱排列为：象>狮>虎>豹>狼>狗>猫>鼠。棋子可以吃掉同级或较弱的棋子。但鼠可以吃掉象，但象却不可以吃掉鼠。若棋子走进敌方的陷阱，任一敌方棋子都可把它吃掉。
3.行动方法：游戏开始时，红方先走，然后轮流走棋。每次可走动一只兽，每只兽每次走一方格，除己方兽穴和小河以外，前后左右均可。
  但是，狮、虎、鼠还有不同走法：
  狮，虎跳河法：狮虎在小河边时，可以纵横对直跳过小河，且能把小河对岸的敌方较小的兽类吃掉，但是如果对方老鼠在河里，把跳的路线阻隔就不能跳，若对岸是对方比自己战斗力强的兽，也不可以跳过小河
鼠游过河法：只有鼠是可以走入小河的兽，走法同陆地上一样，每次走一格，上下左右均可，而且，陆地上的其他兽不可以吃小河中的鼠，小河中的鼠也不能吃陆地上的象，鼠类互吃不受小河影响。
4.胜利：己方任一棋子走进对方兽穴或吃光对方所有棋子者胜。
5.每次开始游戏都由红方先走"
      }

    }
