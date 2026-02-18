cmake_minimum_required(VERSION 3.21)

project(QtLogMonitor VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(QtLogMonitor
    src/main.cpp
    # C++ backend (we will fill these soon)
    # src_backend/LogModel.cpp
    # src_backend/LogReaderWorker.cpp
)

qt_add_resources(QtLogMonitor "app_resources"
    PREFIX "/"
    FILES
        qml/Main.qml
        qml/components/TopBar.qml
        qml/components/LogList.qml
)

target_include_directories(QtLogMonitor PRIVATE
    include
)

target_link_libraries(QtLogMonitor PRIVATE
    Qt6::Quick
)

