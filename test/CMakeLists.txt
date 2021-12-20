cmake_minimum_required(VERSION 3.2)
project(divider_tests)

# add_subdirectory(lib/googletest)

include(${PROJECT_SOURCE_DIR}/cmake/gtest.cmake)

include_directories(${DIVISION_HEADERS_DIR})

set(SOURCE_FILES main.cpp src/divider_tests.cpp)

add_executable(divider_tests ${SOURCE_FILES})
add_dependencies(divider_tests googletest)


target_link_libraries(divider_tests division gtest gtest_main pthread)

add_test(test divider_tests)
add_custom_target(check COMMAND ${CMAKE_CTEST_COMMAND}
                  DEPENDS divider_tests)

# add_test(test_build
#   "${CMAKE_COMMAND}"
#   --build "${CMAKE_BINARY_DIR}"
#   --config "$<CONFIG>"
#   --target test
# )
# set_tests_properties(test_build PROPERTIES FIXTURES_SETUP    test_fixture)
# add_test(test divider_tests)
# set_tests_properties(test       PROPERTIES FIXTURES_REQUIRED test_fixture)
# install(TARGETS divider_tests DESTINATION bin)

