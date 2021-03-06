# Module for locating FFmpeg.
#
# Customizable variables:
#   FFMPEG_ROOT_DIR
#     Specifies FFmpeg's root directory.
#
# Read-only variables:
#   FFMPEG_FOUND
#     Indicates whether the library has been found.
#
#   FFMPEG_INCLUDE_DIRS
#      Specifies FFmpeg's include directory.
#
#   FFMPEG_LIBRARIES
#     Specifies FFmpeg libraries that should be passed to target_link_libararies.
#
#   FFMPEG_<COMPONENT>_LIBRARIES
#     Specifies the libraries of a specific <COMPONENT>.
#
#   FFMPEG_<COMPONENT>_FOUND
#     Indicates whether the specified <COMPONENT> was found.
#
#
# Copyright (c) 2014 Sergiu Dotenco
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

INCLUDE (FindPackageHandleStandardArgs)

IF (CMAKE_VERSION VERSION_GREATER 2.8.7)
  SET (_FFMPEG_CHECK_COMPONENTS FALSE)
ELSE (CMAKE_VERSION VERSION_GREATER 2.8.7)
  SET (_FFMPEG_CHECK_COMPONENTS TRUE)
ENDIF (CMAKE_VERSION VERSION_GREATER 2.8.7)

FIND_PATH (FFMPEG_ROOT_DIR
  NAMES include/libavcodec/avcodec.h
        include/libavdevice/avdevice.h
        include/libavfilter/avfilter.h
        include/libavutil/avutil.h
        include/libswscale/swscale.h
  PATHS ENV FFMPEGROOT
  DOC "FFmpeg root directory")

FIND_PATH (FFMPEG_INCLUDE_DIR
  NAMES libavcodec/avcodec.h
        libavdevice/avdevice.h
        libavfilter/avfilter.h
        libavutil/avutil.h
        libswscale/swscale.h
  HINTS ${FFMPEG_ROOT_DIR}
  PATH_SUFFIXES include
  DOC "FFmpeg include directory")

if (NOT FFmpeg_FIND_COMPONENTS)
  set (FFmpeg_FIND_COMPONENTS avcodec avdevice avfilter avformat avutil swscale)
endif (NOT FFmpeg_FIND_COMPONENTS)

FOREACH (_FFMPEG_COMPONENT ${FFmpeg_FIND_COMPONENTS})
  STRING (TOUPPER ${_FFMPEG_COMPONENT} _FFMPEG_COMPONENT_UPPER)
  SET (_FFMPEG_LIBRARY_BASE FFMPEG_${_FFMPEG_COMPONENT_UPPER}_LIBRARY)

  FIND_LIBRARY (${_FFMPEG_LIBRARY_BASE}
    NAMES ${_FFMPEG_COMPONENT}
    HINTS ${FFMPEG_ROOT_DIR}
    PATH_SUFFIXES bin lib
    DOC "FFmpeg ${_FFMPEG_COMPONENT} library")

  MARK_AS_ADVANCED (${_FFMPEG_LIBRARY_BASE})

  SET (FFMPEG_${_FFMPEG_COMPONENT_UPPER}_FOUND TRUE)

  IF (${_FFMPEG_LIBRARY_BASE})
    # setup the FFMPEG_<COMPONENT>_LIBRARIES variable
    SET (FFMPEG_${_FFMPEG_COMPONENT_UPPER}_LIBRARIES ${${_FFMPEG_LIBRARY_BASE}})
    LIST (APPEND FFMPEG_LIBRARIES ${FFMPEG_${_FFMPEG_COMPONENT_UPPER}_LIBRARIES})
    LIST (APPEND _FFMPEG_ALL_LIBS ${${_FFMPEG_LIBRARY_BASE}})
  ELSE (${_FFMPEG_LIBRARY_BASE})
    SET (FFMPEG_${_FFMPEG_COMPONENT_UPPER}_FOUND FALSE)

    IF (_FFMPEG_CHECK_COMPONENTS)
      LIST (APPEND _FFMPEG_MISSING_LIBRARIES ${_FFMPEG_LIBRARY_BASE})
    ENDIF (_FFMPEG_CHECK_COMPONENTS)
  ENDIF (${_FFMPEG_LIBRARY_BASE})

  SET (FFmpeg_${_FFMPEG_COMPONENT}_FOUND ${FFMPEG_${_FFMPEG_COMPONENT_UPPER}_FOUND})
ENDFOREACH (_FFMPEG_COMPONENT ${FFmpeg_FIND_COMPONENTS})

SET (FFMPEG_INCLUDE_DIRS ${FFMPEG_INCLUDE_DIR})

IF (DEFINED _FFMPEG_MISSING_COMPONENTS AND _FFMPEG_CHECK_COMPONENTS)
  IF (NOT FFmpeg_FIND_QUIETLY)
    MESSAGE (STATUS "One or more FFmpeg components were not found:")
    # Display missing components indented, each on a separate line
    FOREACH (_FFMPEG_MISSING_COMPONENT ${_FFMPEG_MISSING_COMPONENTS})
      MESSAGE (STATUS "  " ${_FFMPEG_MISSING_COMPONENT})
    ENDFOREACH (_FFMPEG_MISSING_COMPONENT ${_FFMPEG_MISSING_COMPONENTS})
  ENDIF (NOT FFmpeg_FIND_QUIETLY)
ENDIF (DEFINED _FFMPEG_MISSING_COMPONENTS AND _FFMPEG_CHECK_COMPONENTS)

# Determine library's version

FIND_PROGRAM (FFMPEG_EXECUTABLE NAMES ffmpeg
  HINTS ${FFMPEG_ROOT_DIR}
  PATH_SUFFIXES bin
  DOC "ffmpeg executable")

IF (FFMPEG_EXECUTABLE)
  EXECUTE_PROCESS (COMMAND ${FFMPEG_EXECUTABLE} -version
    OUTPUT_VARIABLE _FFMPEG_OUTPUT ERROR_QUIET)

  STRING (REGEX REPLACE
    ".*ffmpeg([ \t]+version)[ \t]+([0-9]+(\\.[0-9]+(\\.[0-9]+)?)?).*" "\\2"
    FFMPEG_VERSION "${_FFMPEG_OUTPUT}")
  STRING (REGEX REPLACE "([0-9]+)\\.([0-9]+)(\\.([0-9]+))?" "\\1"
    FFMPEG_VERSION_MAJOR "${FFMPEG_VERSION}")
  STRING (REGEX REPLACE "([0-9]+)\\.([0-9]+)(\\.([0-9]+))?" "\\2"
    FFMPEG_VERSION_MINOR "${FFMPEG_VERSION}")

  IF ("${FFMPEG_VERSION}" MATCHES "^([0-9]+)\\.([0-9]+)\\.([0-9]+)$")
    STRING (REGEX REPLACE "([0-9]+)\\.([0-9]+)(\\.([0-9]+))?" "\\3"
      FFMPEG_VERSION_PATCH "${FFMPEG_VERSION}")
    SET (FFMPEG_VERSION_COMPONENTS 3)
  ELSEIF ("${FFMPEG_VERSION}" MATCHES "^([0-9]+)\\.([0-9]+)\\.([0-9]+)$")
    SET (FFMPEG_VERSION_COMPONENTS 2)
  ELSEIF ("${FFMPEG_VERSION}" MATCHES "^([0-9]+)$")
    # mostly developer/alpha/beta versions
    SET (FFMPEG_VERSION_COMPONENTS 2)
    SET (FFMPEG_VERSION_MINOR 0)
    SET (FFMPEG_VERSION "${FFMPEG_VERSION}.0")
  ENDIF ("${FFMPEG_VERSION}" MATCHES "^([0-9]+)\\.([0-9]+)\\.([0-9]+)$")
ENDIF (FFMPEG_EXECUTABLE)

IF (WIN32)
  FIND_PROGRAM (LIB_EXECUTABLE NAMES lib
    HINTS "$ENV{VS120COMNTOOLS}/../../VC/bin"
          "$ENV{VS110COMNTOOLS}/../../VC/bin"
          "$ENV{VS100COMNTOOLS}/../../VC/bin"
          "$ENV{VS90COMNTOOLS}/../../VC/bin"
          "$ENV{VS71COMNTOOLS}/../../VC/bin"
          "$ENV{VS80COMNTOOLS}/../../VC/bin"
    DOC "Library manager")

  MARK_AS_ADVANCED (LIB_EXECUTABLE)
ENDIF (WIN32)

MACRO (GET_LIB_REQUISITES LIB REQUISITES)
  IF (LIB_EXECUTABLE)
    GET_FILENAME_COMPONENT (_LIB_PATH ${LIB_EXECUTABLE} PATH)

    IF (MSVC)
      # Do not redirect the output
      UNSET (ENV{VS_UNICODE_OUTPUT})
    ENDIF (MSVC)

    EXECUTE_PROCESS (COMMAND ${LIB_EXECUTABLE} /nologo /list ${LIB}
      WORKING_DIRECTORY ${_LIB_PATH}/../../Common7/IDE
      OUTPUT_VARIABLE _LIB_OUTPUT ERROR_QUIET)

    STRING (REPLACE "\n" ";" "${REQUISITES}" "${_LIB_OUTPUT}")
    LIST (REMOVE_DUPLICATES ${REQUISITES})
  ENDIF (LIB_EXECUTABLE)
ENDMACRO (GET_LIB_REQUISITES)

IF (_FFMPEG_ALL_LIBS)
  # collect lib requisites using the lib tool
  FOREACH (_FFMPEG_COMPONENT ${_FFMPEG_ALL_LIBS})
    GET_LIB_REQUISITES (${_FFMPEG_COMPONENT} _FFMPEG_REQUISITES)
  ENDFOREACH (_FFMPEG_COMPONENT)
ENDIF (_FFMPEG_ALL_LIBS)

IF (NOT FFMPEG_BINARY_DIR)
  SET (_FFMPEG_UPDATE_BINARY_DIR TRUE)
ELSE (NOT FFMPEG_BINARY_DIR)
  SET (_FFMPEG_UPDATE_BINARY_DIR FALSE)
ENDIF (NOT FFMPEG_BINARY_DIR)

SET (_FFMPEG_BINARY_DIR_HINTS bin)

IF (_FFMPEG_REQUISITES)
  FIND_FILE (FFMPEG_BINARY_DIR NAMES ${_FFMPEG_REQUISITES}
	  HINTS ${FFMPEG_ROOT_DIR}
    PATH_SUFFIXES ${_FFMPEG_BINARY_DIR_HINTS} NO_DEFAULT_PATH)
ENDIF (_FFMPEG_REQUISITES)

IF (FFMPEG_BINARY_DIR AND _FFMPEG_UPDATE_BINARY_DIR)
  SET (_FFMPEG_BINARY_DIR ${FFMPEG_BINARY_DIR})
  UNSET (FFMPEG_BINARY_DIR CACHE)

  IF (_FFMPEG_BINARY_DIR)
	GET_FILENAME_COMPONENT (FFMPEG_BINARY_DIR ${_FFMPEG_BINARY_DIR} PATH)
  ENDIF (_FFMPEG_BINARY_DIR)
ENDIF (FFMPEG_BINARY_DIR AND _FFMPEG_UPDATE_BINARY_DIR)

SET (FFMPEG_BINARY_DIR ${FFMPEG_BINARY_DIR} CACHE PATH "FFmpeg binary directory")

MARK_AS_ADVANCED (FFMPEG_INCLUDE_DIR FFMPEG_BINARY_DIR)

IF (NOT _FFMPEG_CHECK_COMPONENTS)
 SET (_FFMPEG_FPHSA_ADDITIONAL_ARGS HANDLE_COMPONENTS)
ENDIF (NOT _FFMPEG_CHECK_COMPONENTS)

FIND_PACKAGE_HANDLE_STANDARD_ARGS (FFmpeg REQUIRED_VARS FFMPEG_ROOT_DIR
  FFMPEG_INCLUDE_DIR ${_FFMPEG_MISSING_LIBRARIES} VERSION_VAR FFMPEG_VERSION
  ${_FFMPEG_FPHSA_ADDITIONAL_ARGS})
