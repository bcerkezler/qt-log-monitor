import QtQuick
import QtQuick.Controls

ListView {
    id: root
    property string searchText: ""
    property string levelFilter: "ALL"
    property var modelSource

    anchors.fill: parent
    anchors.margins: 10
    clip: true
    model: modelSource

    delegate: Text {
        required property string level
        required property string msg
        required property string time

        visible: {
            const s = root.searchText.trim().toLowerCase()
            const passSearch = s.length === 0 || msg.toLowerCase().indexOf(s) >= 0
            const passLevel = (root.levelFilter === "ALL") || (level === root.levelFilter)
            return passSearch && passLevel
        }

        text: "[" + time + "] " + level + "  " + msg
        color: level === "ERROR" ? "#ff6b6b"
              : level === "WARN" ? "#ffd166"
              : "#e2e8f0"
        font.family: "Consolas"
        font.pixelSize: 14
    }
}
