########################### GTEST
# Enable ExternalProject CMake module
INCLUDE(ExternalProject)

# Set default ExternalProject root directory
SET_DIRECTORY_PROPERTIES(PROPERTIES EP_PREFIX ${CMAKE_BINARY_DIR}/third_party)

set(EXTERNAL_INSTALL_LOCATION ${CMAKE_BINARY_DIR}/external)

# Add gtest
# http://stackoverflow.com/questions/9689183/cmake-googletest
ExternalProject_Add(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG release-1.11.0
    GIT_SHALLOW TRUE
    GIT_PROGRESS TRUE
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}
    # LOG_DOWNLOAD ON
    # LOG_CONFIGURE ON
    # LOG_BUILD ON
    )


include_directories(${EXTERNAL_INSTALL_LOCATION}/include)
link_directories(${EXTERNAL_INSTALL_LOCATION}/lib)

# Specify include dir
# ExternalProject_Get_Property(googletest source_dir)
# set(GTEST_INCLUDE_DIR ${source_dir}/include)

# # Library
# ExternalProject_Get_Property(googletest binary_dir)
# set(GTEST_LIBRARY_PATH ${binary_dir}/${CMAKE_FIND_LIBRARY_PREFIXES}gtest.a)
# set(GTEST_LIBRARY gtest)
# add_library(${GTEST_LIBRARY} UNKNOWN IMPORTED)
# set_property(TARGET ${GTEST_LIBRARY} PROPERTY IMPORTED_LOCATION
#                 ${GTEST_LIBRARY_PATH} )
# add_dependencies(${GTEST_LIBRARY} googletest)