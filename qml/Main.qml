import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components"

ApplicationWindow {
    id: win
    width: 1000
    height: 650
    visible: true
    title: "QtLogMonitor"

    ListModel {
        id: fakeModel
        ListElement { time: "12:00:01"; level: "INFO";  msg: "Application started" }
        ListElement { time: "12:00:02"; level: "INFO";  msg: "Connecting to source..." }
        ListElement { time: "12:00:03"; level: "WARN";  msg: "Slow response detected" }
        ListElement { time: "12:00:04"; level: "ERROR"; msg: "Failed to parse line 184" }
        ListElement { time: "12:00:05"; level: "INFO";  msg: "Retrying..." }
    }

    Item {
        anchors.fill: parent
        anchors.margins: 12

        ColumnLayout {
            anchors.fill: parent
            spacing: 8

            TopBar {
                id: topBar
                Layout.fillWidth: true
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 8
                color: "#1e1e1e"

                LogList {
                    searchText: topBar.searchText
                    levelFilter: topBar.levelText
                    modelSource: fakeModel
                }
            }
        }
    }
}



