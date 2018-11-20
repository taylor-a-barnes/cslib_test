cmake_minimum_required(VERSION 3.5)

project(cslib_test
        LANGUAGES C CXX Fortran)

add_executable(main
           main.c)

target_link_libraries(main /home/tbarnes/mdi/cslib_test/lib/cslib_build/libcslib.so)
set_target_properties(main
                      PROPERTIES LINKER_LANGUAGE CXX)
