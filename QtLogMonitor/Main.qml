import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: win
    width: 1000
    height: 650
    visible: true
    title: "QtLogMonitor"

    property string levelFilter: "ALL"

    Item {
        anchors.fill: parent
        anchors.margins: 12

        ColumnLayout {
            anchors.fill: parent
            spacing: 8

            RowLayout {
                Layout.fillWidth: true
                spacing: 8

                TextField {
                    id: searchBox
                    Layout.fillWidth: true
                    placeholderText: "Search logs..."
                }

                ComboBox {
                    id: levelCombo
                    model: ["ALL", "INFO", "WARN", "ERROR"]
                    onCurrentTextChanged: win.levelFilter = currentText
                }

                Button {
                    text: "Open File"
                    enabled: false
                }

                Button {
                    text: "Pause"
                    enabled: false
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 8
                color: "#1e1e1e"

                ListView {
                    anchors.fill: parent
                    anchors.margins: 10
                    clip: true
                    model: fakeModel

                    delegate: Text {
                        required property string level
                        required property string msg
                        required property string time

                        visible: {
                            const s = searchBox.text.trim().toLowerCase()
                            const passSearch = s.length === 0 || msg.toLowerCase().indexOf(s) >= 0
                            const passLevel = (win.levelFilter === "ALL") || (level === win.levelFilter)
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
            }
        }
    }

    ListModel {
        id: fakeModel
        ListElement { time: "12:00:01"; level: "INFO";  msg: "Application started" }
        ListElement { time: "12:00:02"; level: "INFO";  msg: "Connecting to source..." }
        ListElement { time: "12:00:03"; level: "WARN";  msg: "Slow response detected" }
        ListElement { time: "12:00:04"; level: "ERROR"; msg: "Failed to parse line 184" }
        ListElement { time: "12:00:05"; level: "INFO";  msg: "Retrying..." }
    }
}


