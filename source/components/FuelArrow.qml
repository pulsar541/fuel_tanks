import QtQuick 2.0
import QtQuick.Shapes 1.0

Item {
    id: rootItem

    property color color
    property color bgColor
    property bool direction: true // true = left. false = right

    Component {
        id: compDirLeft
        Shape {
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            ShapePath {
                id: shapePath
                strokeWidth: 3
                strokeColor: rootItem.color
                fillColor: bgColor
                startX: 0; startY: rootItem.height * 0.5

                PathLine { x: rootItem.width; y: 0 }
                PathLine { x: rootItem.width; y: rootItem.height }
                PathLine { x: shapePath.startX; y: shapePath.startY }
            }
        }
    }

    Component {
        id: compDirRight
        Shape {
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            ShapePath {
                id: shapePath
                strokeWidth: 3
                strokeColor: rootItem.color
                fillColor: bgColor
                startX: rootItem.width; startY: rootItem.height * 0.5

                PathLine { x: 0; y: 0 }
                PathLine { x: 0; y: rootItem.height }
                PathLine { x: shapePath.startX; y: shapePath.startY }
            }
        }
    }




    Loader {
        id: loader

        anchors.fill: parent
        sourceComponent: direction ? compDirLeft : compDirRight
    }

}
