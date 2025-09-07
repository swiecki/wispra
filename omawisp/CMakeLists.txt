cmake_minimum_required(VERSION 3.16)
project(omawisp LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

option(OMAWISP_WITH_PIPEWIRE "Build PipeWire audio backend" ON)
option(OMAWISP_WITH_ALSA "Build ALSA audio backend" ON)
option(OMAWISP_WITH_CLEANUP "Enable optional LLM cleanup HTTP client" ON)
option(OMAWISP_WITH_RT "Use realtime priorities when available" ON)
option(OMAWISP_ENABLE_LTO "Enable link-time optimization" ON)

include(CheckIncludeFile)
find_package(Threads REQUIRED)

include(GNUInstallDirs)

# pkg-config is used for PipeWire and ALSA
find_package(PkgConfig REQUIRED)
if(OMAWISP_WITH_PIPEWIRE)
  pkg_check_modules(PIPEWIRE libpipewire-0.3)
  if(PIPEWIRE_FOUND)
    message(STATUS "Found PipeWire: ${PIPEWIRE_VERSION}")
  else()
    message(WARNING "PipeWire not found; PipeWire backend will be disabled")
    set(OMAWISP_WITH_PIPEWIRE OFF)
  endif()
endif()

if(OMAWISP_WITH_ALSA)
  pkg_check_modules(ALSA alsa)
  if(ALSA_FOUND)
    message(STATUS "Found ALSA: ${ALSA_VERSION}")
  else()
    message(WARNING "ALSA not found; ALSA backend will be disabled")
    set(OMAWISP_WITH_ALSA OFF)
  endif()
endif()

# whisper.cpp submodule (preferred). If missing, user should run scripts/install.sh
set(WHISPER_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third_party/whisper.cpp)
if(EXISTS ${WHISPER_DIR}/CMakeLists.txt)
  set(WHISPER_SDL2 OFF CACHE BOOL "" FORCE)
  set(WHISPER_PORTAUDIO OFF CACHE BOOL "" FORCE)
  set(WHISPER_COREML OFF CACHE BOOL "" FORCE)
  set(WHISPER_OPENVINO OFF CACHE BOOL "" FORCE)
  add_subdirectory(${WHISPER_DIR} EXCLUDE_FROM_ALL)
  set(HAVE_WHISPER TRUE)
else()
  message(WARNING "third_party/whisper.cpp not found. Run scripts/install.sh to fetch submodule.")
  set(HAVE_WHISPER FALSE)
endif()

# WebRTC VAD (vendored minimal C sources). If missing, we compile a lightweight stub.
set(WEBRTCVAD_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third_party/webrtcvad)
file(GLOB WEBRTCVAD_SOURCES
  ${WEBRTCVAD_DIR}/webrtc/common_audio/vad/*.c
  ${WEBRTCVAD_DIR}/webrtc/common_audio/signal_processing/*.c
  ${WEBRTCVAD_DIR}/webrtc/common_audio/*.c
)
if(WEBRTCVAD_SOURCES)
  add_library(webrtcvad STATIC ${WEBRTCVAD_SOURCES})
  target_include_directories(webrtcvad PUBLIC ${WEBRTCVAD_DIR})
  target_compile_definitions(webrtcvad PRIVATE WEBRTC_POSIX)
  set(HAVE_WEBRTCVAD TRUE)
else()
  message(WARNING "WebRTC VAD sources not present; building with lightweight stub VAD.")
  add_library(webrtcvad STATIC src/daemon/vad_stub.c)
  set(HAVE_WEBRTCVAD FALSE)
endif()

# Sources
set(OMAWISP_DAEMON_SOURCES
  src/main.cpp
  src/daemon/app.cpp
  src/daemon/audio_pipewire.cpp
  src/daemon/audio_alsa.cpp
  src/daemon/vad_webrtc.cpp
  src/daemon/transcriber_whisper.cpp
  src/daemon/output_paste.cpp
  src/daemon/config.cpp
  src/daemon/metrics.cpp
)

add_executable(omawispd ${OMAWISP_DAEMON_SOURCES})

if(OMAWISP_ENABLE_LTO)
  include(CheckIPOSupported)
  check_ipo_supported(RESULT lto_supported OUTPUT lto_err)
  if(lto_supported)
    set_property(TARGET omawispd PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE)
  endif()
endif()

# Compile flags
if(CMAKE_CXX_COMPILER_ID MATCHES "Clang|GNU")
  target_compile_options(omawispd PRIVATE -O3 -march=native -ffast-math -fno-exceptions)
endif()

# Includes
if(OMAWISP_WITH_PIPEWIRE)
  target_include_directories(omawispd PRIVATE ${PIPEWIRE_INCLUDE_DIRS})
  target_link_libraries(omawispd PRIVATE ${PIPEWIRE_LIBRARIES})
endif()
if(OMAWISP_WITH_ALSA)
  target_include_directories(omawispd PRIVATE ${ALSA_INCLUDE_DIRS})
  target_link_libraries(omawispd PRIVATE ${ALSA_LIBRARIES})
endif()

target_link_libraries(omawispd PRIVATE webrtcvad Threads::Threads m)

if(HAVE_WHISPER)
  target_link_libraries(omawispd PRIVATE whisper)
  target_compile_definitions(omawispd PRIVATE OMAWISP_HAVE_WHISPER=1)
endif()

# CLI
add_executable(omawisp-ptt src/cli/omawisp_cli.cpp)
if(CMAKE_CXX_COMPILER_ID MATCHES "Clang|GNU")
  target_compile_options(omawisp-ptt PRIVATE -O3 -march=native)
endif()

# Install
install(TARGETS omawispd omawisp-ptt RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
install(FILES scripts/omawisp.service DESTINATION ${CMAKE_INSTALL_DATADIR}/omawisp)
install(FILES scripts/sample-hyprland.conf DESTINATION ${CMAKE_INSTALL_DATADIR}/omawisp)

message(STATUS "Build summary:")
message(STATUS "  PipeWire: ${OMAWISP_WITH_PIPEWIRE}")
message(STATUS "  ALSA:     ${OMAWISP_WITH_ALSA}")
message(STATUS "  Whisper:  ${HAVE_WHISPER}")
message(STATUS "  VAD:      ${HAVE_WEBRTCVAD}")
