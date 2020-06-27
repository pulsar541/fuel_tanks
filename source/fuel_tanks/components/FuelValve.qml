import QtQuick 2.0
import QtQuick.Shapes 1.0

Item {
    id: rootItem

    property alias color: shapePath.fillColor

    Shape {
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        ShapePath {
            id: shapePath
            //dashPattern: [ 1, 4 ]
            strokeColor: fillColor
            startX: rootItem.width; startY: 0
            PathLine { x: 0; y: 0 }
            PathLine { x: rootItem.width * 0.5; y: rootItem.height }
            PathLine { x: rootItem.width; y: 0 }
        }
    }

}
