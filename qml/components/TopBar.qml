import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout {
    id: root
    property alias searchText: searchBox.text
    property alias levelText: levelCombo.currentText

    signal openFileRequested()
    signal pauseRequested()

    spacing: 8

    TextField {
        id: searchBox
        Layout.fillWidth: true
        placeholderText: "Search logs..."
    }

    ComboBox {
        id: levelCombo
        model: ["ALL", "INFO", "WARN", "ERROR"]
    }

    Button {
        text: "Open File"
        onClicked: root.openFileRequested()
        enabled: false
    }

    Button {
        text: "Pause"
        onClicked: root.pauseRequested()
        enabled: false
    }
}
