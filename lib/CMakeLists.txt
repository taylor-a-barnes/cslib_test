cmake_minimum_required(VERSION 3.9)

# Compile without ZMQ
SET(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -DZMQ_NO")
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/cslib/src/STUBS_ZMQ/)

# Attempt to locate MPI
#####find_package(MPI)
if(${MPI_FOUND})
  message("CSlib located MPI")
  include_directories(${MPI_INCLUDE_PATH})
  SET(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -DMPI_YES")
else(${MPI_FOUND})
  message("CSlib could not locate MPI")
  SET(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -DMPI_NO")
endif()

# Collect all of the source files in CSlib_sources
FILE(GLOB CSlib_sources cslib/src/*.cpp)

add_library(cslib STATIC
                ${CSlib_sources})

# Provide MPI link information
if(${MPI_FOUND})
  target_link_libraries(cslib ${MPI_LIBRARIES})

  if(MPI_COMPILE_FLAGS)
    set_target_properties(cslib PROPERTIES
      COMPILE_FLAGS "${MPI_COMPILE_FLAGS}")
  endif()

  if(MPI_LINK_FLAGS)
    set_target_properties(cslib PROPERTIES
      LINK_FLAGS "${MPI_LINK_FLAGS}")
  endif()
else(${MPI_FOUND})
  include_directories(${CMAKE_CURRENT_SOURCE_DIR}/cslib/src/STUBS_MPI/)
endif()
