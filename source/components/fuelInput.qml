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
        leftPadding: 5


        //inputMethodHints: Qt.ImhFormattedNumbersOnly
        maximumLength: 4

        Component.onCompleted: {
            text = "0"
            cursorPosition = 0
        }

        onTextEdited: {
            var vol = parseFloat(ti.text.trim())

            if(text.trim() === "") {
                vol = 0
                text = "0"
                volumeChanged(vol)
                return
            }

            if(text.trim().indexOf(".") === text.trim().length-1) {
                return
            }

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
