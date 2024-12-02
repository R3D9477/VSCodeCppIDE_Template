# ATTACH EXTERNAL LIBRARIES BELOW...

add_subdirectory("lib/libcppinfo")
add_subdirectory("lib/libproject_version")
add_subdirectory("lib/libzexample")

IS_CONANFILE_CONTAINS("boost" IS_IN_CONANFILE)
if(${IS_IN_CONANFILE})
    find_package(Boost COMPONENTS ALL CONFIG)
    if(Boost_FOUND)
        message("Boost version is " ${Boost_VERSION})
        target_link_libraries(${MAIN_TARGET} PUBLIC Boost::boost)
        if(DEFINED ENV{VCPKG_ROOT})
            find_package(boost_thread CONFIG REQUIRED)
            target_link_libraries(${MAIN_TARGET} PRIVATE Boost::thread)
        else()
            target_link_libraries(${MAIN_TARGET} PUBLIC boost_thread)
        endif()
        if(WIN32)
            target_link_libraries(${MAIN_TARGET} PUBLIC ws2_32)
        else()
            target_link_libraries(${MAIN_TARGET} PUBLIC pthread)
        endif()
    endif()
endif()
