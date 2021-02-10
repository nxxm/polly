# Copyright (c) 2016-2018, Ruslan Baratov
# Copyright (c) 2017, David Hirvonen
# All rights reserved.

if(DEFINED POLLY_CLANG_CXX17_CMAKE_)
  return()
else()
  set(POLLY_CLANG_CXX17_CMAKE_ 1)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_init.cmake")

if (CMAKE_HOST_WIN32)
  polly_init(
      "clang / c++17 support"
      "MinGW Makefiles"
  )
else()
  polly_init(
      "clang / c++17 support"
      "Unix Makefiles"
  )
endif()

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_common.cmake")

include("${CMAKE_CURRENT_LIST_DIR}/compiler/clang.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/flags/cxx17.cmake")


if (CMAKE_HOST_WIN32)
  set (CMAKE_C_FLAGS "${CMAKE_CXX_FLAGS} -femulated-tls -DWIN32_LEAN_AND_MEAN -D_WIN32_WINNT=0x0A00 " CACHE STRING "")
  set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -femulated-tls -DWIN32_LEAN_AND_MEAN -D_WIN32_WINNT=0x0A00 " CACHE STRING "")
endif()
