import QtQuick 2.0

Item {
    id: rootItem

    property real maxVolume: 15
    property real volume
    property color themeColor: "#88ff88"
    property color bgColor
    property alias fontSizePx: txVolume.font.pixelSize

    Rectangle {
        id: rectTank

        anchors.fill: parent
        color: rootItem.bgColor
        border.width: 3
        border.color: themeColor

        property real relativeParentHeight: rootItem.maxVolume > 0? (rootItem.volume / rootItem.maxVolume) : 0

        Rectangle {
            id: rectFuel

            anchors.bottom: parent.bottom
            width: parent.width
            height: parent.height * rectTank.relativeParentHeight
            color: themeColor
        }

        Rectangle {
            id: rectVolumeText

            anchors.centerIn: parent
            width: 3 * parent.width / 5
            height: parent.height / 5
            color: rootItem.bgColor
            border.width: 3
            border.color: themeColor
            Text {
                id: txVolume

                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                anchors.rightMargin: parent.width * 0.2
                text: volume.toString()
                color: themeColor
            }
        }
    }
}
