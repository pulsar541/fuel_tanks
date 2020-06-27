import QtQuick 2.13

Rectangle {
    id: rootItem
    color:  "#eeeeee"
    property alias text: ti.text
    property real maxVolume

    signal volumeChanged(real volume)

    TextInput {
        id : ti
        font.pointSize: 12
        anchors.fill: parent
        //inputMethodHints: Qt.ImhFormattedNumbersOnly

        Component.onCompleted: {
            text = "0"
            cursorPosition = 0
        }

        onTextEdited: {
            if(text.trim() === "") {
                text = "0"
            }

            text.replace(",",".")

            if(text.indexOf(".") === text.length-1) {
                return
            }

            var vol = parseFloat(ti.text.trim())
            if(vol < 0) {
                vol = 0
            }
            if(vol > maxVolume) {
                vol = maxVolume
            }
            text = vol.toString()
            volumeChanged(vol)
        }

    }
}
