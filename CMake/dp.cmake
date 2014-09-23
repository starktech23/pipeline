if ( "${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "armv7l")
  set(DP_ARCH "${CMAKE_SYSTEM_PROCESSOR}" CACHE STRING "CPU Architecture" )
elseif( CMAKE_SIZEOF_VOID_P EQUAL 8 )
  set (DP_ARCH "amd64" CACHE STRING "CPU Architecture")
else ()
  set (DP_ARCH "x86" CACHE STRING "CPU Architecture")
endif()
