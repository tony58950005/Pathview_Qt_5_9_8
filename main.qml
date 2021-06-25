import QtQuick.Window 2.2
import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.4
import com.company.openotherapp 1.0

Window {
    id:rootWindow
    visible: true
    width:Screen.width;height:Screen.height
    //x:0;y:0
    Openotherapp{
        id:openOtherApp
    }

    Image{
        id:img
        //x:0;y:0
        anchors{
            left:rootWindow.left
            top:rootWindow.top
            //centerIn: true
        }
        //width:Screen.width*scale;height:Screen.height*scale
        width:1280*scale;height:800*scale
        rotation: 0
        //transformOrigin: img.Center
        source:"qrc:/topeet_background_stretch.jpg"
        scale:1
        opacity: 1
        fillMode: Image.PreserveAspectFit

        signal clicked

        ListModel {

            id: nameModel
            ListElement {
                number:0
                //id:calendar1
                file: "qrc:/calendar_icon.svg.png"
                name: "calendar01"
            }

            ListElement { file: "qrc:/camera_icon.svg.png"
                name: "camera01"
            }

            ListElement { file: "qrc:/music_icon.svg.png"
                name: "music01"
            }
            ListElement { file: "qrc:/todo_icon.svg.png"
                name: "todo01"
            }

            ListElement {
                file: "qrc:/calendar_icon.svg.png"
                name: "calendar02"
            }
            ListElement { file: "qrc:/fingerpaint_icon.svg.png"
                name: "fingerpaint01"
            }
            ListElement { file: "qrc:/videoplayer_icon.svg.png"
                name: "videoplayer01"
            }
            ListElement { file: "qrc:/bookmarks_icon.svg.png"
                name: "bookmarks01"
            }

            ListElement {
                file: "qrc:/buzzer_icon.svg.png"
                name: "buzzer01"
            }
            ListElement { file: "qrc:/led_icon.svg.png"
                name: "led01"
            }
            ListElement { file: "qrc:/browser_icon.svg.png"
                name: "browser01"
            }
            ListElement { file: "qrc:/homebutton_icon.svg.png"
                name: "homebutton01"
            }

        }

        Component {
            id: nameDelegate

            Item{
                width: 64; height: 64
                scale: PathView.iconScale
                opacity: PathView.iconOpacity
                Column {

                    //opacity: PathView.isCurrentItem?1:0.8
                    Image {
                        id:img
                        anchors.horizontalCenter: delegateText.horizontalCenter
                        source: model.file
                        width: 64; height: 64
                        smooth: true
                        //visible: PathView.onPath

                        fillMode: Image.PreserveAspectFit
                        MouseArea {
                            anchors.fill: parent
                            onClicked: root.currentIndex = index
                        }
                    }
                    Text {
                        id: delegateText
                        text: model.name; font.pixelSize: 24
                    }
                }
            }

        }

        PathView {
            id:root
            width:parent.width
            height:parent.height
            anchors.centerIn: parent
            rotation: 0

            anchors.fill: parent
            //scale: PathView.iconScale
            //z:PathView.iconZ

            model: nameModel
            delegate: nameDelegate

            highlight: Rectangle {
                color: 'grey'
                Text {
                    anchors.centerIn: parent
                    //text: 'Hello ' + nameModel.get(root.currentIndex).name
                    color: 'white'
                }
            }

            focus: true
            onCurrentItemChanged: {
                console.log(nameModel.get(root.currentIndex).name + ' selected')
                if(nameModel.get(root.currentIndex).name ==='bookmarks01'){
                    openOtherApp.openBookmarks();
                }else if(nameModel.get(root.currentIndex).name ==='buzzer01'){
                    openOtherApp.openBuzzer();
                }else if(nameModel.get(root.currentIndex).name ==='browser01'){
                    openOtherApp.openBrowser();
                }else if(nameModel.get(root.currentIndex).name ==='videoplayer01'){
                    openOtherApp.openVideoplayer();
                }else if(nameModel.get(root.currentIndex).name ==='fingerpaint01'){
                    openOtherApp.openFingerpaint();
                }else{

                }
            }
//            MouseArea{
//                anchors.fill: parent
////                onClicked: pathAnimation.restart()
//                onClicked: {
//                    console.log("start onClicked");
//                    openOtherApp.openTerminal();
//                }
//            }



            path:Path{
                id:myPath
                startX: img.width/2; startY: img.height/2+200
                PathAttribute{ name:"iconScale"; value: 1.0 }
                PathAttribute{ name:"iconOpacity"; value: 1.0 }

                PathArc {
                    x: img.width/2; y: img.height/2-radiusY
                    radiusX: 320; radiusY: 200
                    //useLargeArc: true
                    direction:PathArc.Counterclockwise
                }
                PathAttribute{ name:"iconScale"; value: 0.5 }
                PathAttribute{ name:"iconOpacity"; value: 0.5 }

                PathArc {
                    x: img.width/2; y: img.height/2+radiusY
                    radiusX: 320; radiusY: 200
                    //useLargeArc: true
                    direction:PathArc.Counterclockwise
                }

            }

            SequentialAnimation{
                id:pathAnimation
                loops:Animation.Infinite
            }
            //below is for touch screen or direction keys
            Keys.onLeftPressed: decrementCurrentIndex()
            Keys.onRightPressed: incrementCurrentIndex()
        }


    }
    Button{
        id:quit;
        text:"quit"
        anchors{
            left:parent.left
            leftMargin: 0
            top:img.bottom
            topMargin: 0
        }
//        anchors.centerIn: parent
        onClicked: {
            Qt.quit();
        }
    }

}
