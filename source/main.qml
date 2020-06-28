import QtQuick 2.13
import QtQuick.Window 2.12
import QtQuick.Shapes 1.0

import "components" as Components

Window {
    id: rootItem

    property color themeColor: "#22B14C"
    property color bgColor: "#000000"

    visible: true
    width: 640
    height: 480
    title: qsTr("Fuel tanks")

    Rectangle {
        id: rectBg
        anchors.fill: parent
        color: bgColor
    }

    Item {
        id: itemFuelTanksContainer
        anchors.centerIn: parent

        Component.onCompleted: {
            width = parent.width * 0.65
            height = parent.height / 2
            update()
        }

        Rectangle {
            id: rectBeetweenFuelsPath
            color: "transparent"
            border.width: 3
            border.color: themeColor
            x: fuelTankFirst.width * 0.5 - 2
            y: -80
            width:  parent.width - x - fuelTankSecond.width * 0.5 + 1
            height: fuelTankFirst.height + 120
        }

        Rectangle {
            id: rectInOutFuelsPath
            color: "transparent"
            border.width: 3
            border.color: themeColor
            x: itemFuelTanksContainer.width - fuelTankSecond.width * 0.5-border.width/2
            y: -80
            width:  fuelTankSecond.width
            height: fuelTankFirst.height + 120

            Rectangle {
                width: 3
                height: parent.height
                anchors.right: parent.right
                color: bgColor
            }

            Components.FuelArrow {
                width: 20
                height: 20
                anchors {
                    top: rectInOutFuelsPath.top
                    topMargin: -height * 0.5+1
                    right: rectInOutFuelsPath.right
                }
                bgColor: bgColor
                color: themeColor
                direction: true
            }

            Components.FuelArrow {
                width: 20
                height: 20
                anchors {
                    bottom: rectInOutFuelsPath.bottom
                    bottomMargin: -height * 0.5+1
                    right: rectInOutFuelsPath.right
                }
                bgColor: bgColor
                color: themeColor
                direction: false
            }
        }


        Components.FuelValve {
            id: fuelValveFirst

            width: 39
            height: 39
            anchors {
                horizontalCenter: fuelTankFirst.horizontalCenter
                bottom: fuelTankFirst.top
                bottomMargin: 15
            }

            color: fuelTankFirst.volume <= fuelTankSecond.volume
                   ? themeColor
                   : "#ff0000"

        }

        Components.FuelValve {
            id: fuelValveSecond

            width: 39
            height: 39

            anchors {
                horizontalCenter: fuelTankSecond.horizontalCenter
                bottom: fuelTankSecond.top
                bottomMargin: 15
            }
            color: fuelTankFirst.volume >= fuelTankSecond.volume
                   ? themeColor
                   : "#ff0000"

        }

        Components.FuelTank {
            id: fuelTankFirst

            width: 150
            height: 200
            anchors.topMargin: 40
            volume: tiFirstFuelVolume.volume
            bgColor: bgColor
            fontSizePx: parent.width * 0.075
            themeColor: rootItem.themeColor
        }

        Components.FuelTank {
            id: fuelTankSecond

            width: 150
            height: 200
            anchors.topMargin: 40
            volume: tiSecondFuelVolume.volume
            bgColor: bgColor
            anchors.right: parent.right
            fontSizePx: parent.width * 0.075
            themeColor: rootItem.themeColor
        }
    }

    Item {
        id: itemInputsContainer

        width: parent.width/2
        height: childrenRect.height
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 30

        Text {
            text: qsTr("Объем первого бака(л)")
            anchors.right: tiFirstFuelVolume.left
            anchors.rightMargin: 10
            anchors.verticalCenter: tiFirstFuelVolume.verticalCenter
            color: "#ffffff"
        }

        Text {
            text: qsTr("Объем второго бака(л)")
            anchors.right: tiSecondFuelVolume.left
            anchors.verticalCenter: tiSecondFuelVolume.verticalCenter
            anchors.rightMargin: 10
            color: "#ffffff"
        }

        Components.FuelInput {
            id: tiFirstFuelVolume
            width: 50
            height: 20
            maxVolume: fuelTankFirst.maxVolume
            onVolumeChanged: {
                fuelTankFirst.volume = volume
            }
        }

        Components.FuelInput {
            id: tiSecondFuelVolume
            width: 50
            height: 20
            anchors.top: tiFirstFuelVolume.bottom
            anchors.topMargin: 10
            maxVolume: fuelTankFirst.maxVolume
            onVolumeChanged: {
                fuelTankSecond.volume = volume
            }
        }

    }
}
