# UCMakeSkeleton
Universal simple skeleton of project's tree, based on CMake build system.

# Stucture
**[ PROJECT ]**
<br/>ㅤㅤㅤ|- *[CMakeLists.txt](CMakeLists.txt)*
<br/>ㅤㅤㅤ|- test
<br/>ㅤㅤㅤ|- lib
<br/>ㅤㅤㅤㅤㅤㅤ|- **[ somelib ]**
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- *[CMakeLists.txt](lib/somelib/CMakeLists.txt)*
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- include
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- src
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- test
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- thirdparty
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- **[ thirdlib ]**
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- *[CMakeLists.txt](lib/somelib/thirdparty/thirdlib/CMakeLists.txt)*
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- include
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- src
<br/>ㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤㅤ|- test

# Features
* automatically [applies](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L6) name of directory as name of a project/library
* automatically [scans and adds](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L9) needed sources and includes into the project's tree **(non-recursive globbing)**; easy and flexible configuration process of source tree for current target: just [add](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L11) needed folder [to list](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L11)
* automatically adds some of libraries (if possible): [Boost](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L241), [Qt5](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L121), [Qt6](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L121)
* [applies](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L142) some compiler's extra flags because of safety
* automatically [adds boost unit tests](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L270) *(**don't use** the dot symbol '.' in the name of test's source file!)*

# How to
1. clone that repositoy to your local machine
2. add [HERE](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L11) specific sources and includes of your current project (example you can see [HERE](https://github.com/R3D9477/SimpleCustomQmlItemQt6Cmake/blob/master/CMakeLists.txt#L12))
3. add some external libraries [HERE](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L225). example of attaching some external libraries:
```
...
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
# ATTACH EXTERNAL LIBRARIES BELOW...

find_package(OpenCV REQUIRED)
target_link_libraries(${OUTPUT_NAME} PUBLIC opencv::opencv)

target_link_libraries(${OUTPUT_NAME} PUBLIC "${CMAKE_SOURCE_DIR}/myOwnSDK/lib/x64/libMySDK.so")
target_include_directories(${OUTPUT_NAME} PUBLIC "${CMAKE_SOURCE_DIR}/myOwnSDK/include")

find_package(Qt${QT_VERSION_MAJOR} COMPONENTS SerialPort Sql REQUIRED)
target_link_libraries(${OUTPUT_NAME} PUBLIC Qt::SerialPort)
target_link_libraries(${OUTPUT_NAME} PUBLIC Qt::Sql)
...
```
4. add source of uint tests by the path `test/test_<PROJECT_NAME>.cpp` or add/change you testing configuration [HERE](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L236)

# Extra variables
you can use some of variables in your own configuration:
* **variable** `SAFETY_FLAGS` - contains the [list of the compiler's flags](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L142) to make your code more safe. example of usage you can find [HERE](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L225), [HERE](https://github.com/R3D9477/UCMakeSkeleton/blob/main/lib/somelib/CMakeLists.txt#L15) and [HERE](https://github.com/R3D9477/UCMakeSkeleton/blob/main/lib/somelib/thirdparty/thirdlib/CMakeLists.txt#L15)
* **variable** `OUTPUT_NAME` - the name of the current target name (target executable file name). usually it the same as varibale `PROJECT_NAME`, but for Qt6 application it different: `app${PROJECT_NAME}`. example of usage you can find [HERE](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L253), [HERE](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L260) and [HERE](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L270)

# Extra functions
you can use some of functions in your own configuration:
* **function** `get_sources_from_dir( SOURCES_DEST_VAR INCLUDES_DEST_VAR TARGET_FOLDER_PATH )` - scans `TARGET_FOLDER_PATH` and adds C++ files by the [mask](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L17) into variables: `SOURCES_DEST_VAR` (list of source files) and `INCLUDES_DEST_VAR` (list of include paths). examples of usage you can find [HERE](https://github.com/R3D9477/UCMakeSkeleton/blob/main/lib/somelib/CMakeLists.txt#L8) and [HERE](https://github.com/R3D9477/UCMakeSkeleton/blob/main/lib/somelib/thirdparty/thirdlib/CMakeLists.txt#L8)
* **function** `target_add_boost( TARGET_NAME )` - adds boost library to your target (if it possible). example of usage you can find [HERE](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L221)
* **function** `target_add_Qt( TARGET_NAME )` - adds Qt to your target (if it possible). example of usage you can find [HERE](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L90)
* **function** `target_add_tests_from_folder( TARGET_NAME FOLDER_PATH )` - applies Boost unit tests from specified folder (relative or absolute path) for specified target. each source file will be used as individual testing module. examples of usage you can find [HERE](https://github.com/R3D9477/UCMakeSkeleton/blob/main/CMakeLists.txt#L270) (for [TESTS](https://github.com/R3D9477/UCMakeSkeleton/tree/main/test)), [HERE](https://github.com/R3D9477/UCMakeSkeleton/blob/main/lib/somelib/CMakeLists.txt#L32) (for [TESTS](https://github.com/R3D9477/UCMakeSkeleton/tree/main/lib/somelib/test)) and [HERE](https://github.com/R3D9477/UCMakeSkeleton/blob/main/lib/somelib/thirdparty/thirdlib/CMakeLists.txt#L29) (for [TESTS](https://github.com/R3D9477/UCMakeSkeleton/tree/main/lib/somelib/thirdparty/thirdlib/test))

# Tested on
* Linux (GCC,Clang)
* Windows (Clang,MinGW,MSVC)

# Links
* used in template of ["Qml Multilingual Application"](https://github.com/R3D9477/EmptyQmlMuiApp)
* used in demo ["Simple Custom Qml Item Qt6 Cmake"](https://github.com/R3D9477/SimpleCustomQmlItemQt6Cmake)
