include(CopyFile)

set( MDL_SDK_ROOT "${DP_3RDPARTY_PATH}/MDL_SDK" )

if ( EXISTS "${MDL_SDK_ROOT}" AND IS_DIRECTORY "${MDL_SDK_ROOT}" )

  set( MDL_SDK_INCLUDE_DIR "${MDL_SDK_ROOT}/include" )

  if (WIN32)
    set( MDL_SDK_BIN_DIR "${MDL_SDK_ROOT}/nt-x86-64/lib" )
    set( MDL_SDK "${MDL_SDK_BIN_DIR}/libmdl_sdk.dll" )
    set( MDL_FREE_IMAGE "${MDL_SDK_BIN_DIR}/nv_freeimage.dll" )
  endif(WIN32)
  if ( UNIX )
    set( MDL_SDK_BIN_DIR "${MDL_SDK_ROOT}/linux-x86-64/lib" )
    set( MDL_SDK "${MDL_SDK_BIN_DIR}/libmdl_sdk.so" )
    set( MDL_FREE_IMAGE "${MDL_SDK_BIN_DIR}/nv_freeimage.so" )
  endif( UNIX )
  
  if( EXISTS "${MDL_SDK}" )
    set(MDL_SDK_FOUND TRUE)
  endif()

  MACRO( CopyMDL_SDK target )
    if ("${CMAKE_GENERATOR}" MATCHES "^(Visual Studio).*")
      copy_file_if_changed( ${target} "${MDL_SDK}" "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/$(ConfigurationName)" )
      copy_file_if_changed( ${target} "${MDL_FREE_IMAGE}" "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/$(ConfigurationName)" )
    else()
      copy_file_if_changed( ${target} "${MDL_SDK}" "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}" )
      copy_file_if_changed( ${target} "${MDL_FREE_IMAGE}" "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}" )
    endif()
  ENDMACRO()
else()
  message("MDL SDK not found in ${MDL_SDK_ROOT}. More information can be found at https://developer.nvidia.com/mdl-sdk.")
endif()
