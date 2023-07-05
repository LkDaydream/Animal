import QtQuick
 TapHandler{
        id:ahandle
        acceptedDevices:PointerDevice.Mouse
        onTapped: {

            parent.selected=true
            //点击动物棋子更新初始坐标
            if (parent.selected) {
             parent.lastX=(Math.floor(parent.x/100)*100)+50
             parent.lastY=(Math.floor(parent.y/100)*100)+50
            }
        }
    }



