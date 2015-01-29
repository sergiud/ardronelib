cmake_minimum_required (VERSION 2.8.11)
project (ARDroneSDK C)

list (APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

find_package (Threads REQUIRED)
find_package (FFmpeg REQUIRED avcodec avformat avutil swscale)

configure_file (generated_custom.h.cmake.in generated_custom.h)

include_directories (${CMAKE_CURRENT_BINARY_DIR})

add_library (ardrone_tool STATIC
  ARDroneLib/Soft/Lib/ardrone_tool/AT/ardrone_at_mutex.c
  ARDroneLib/Soft/Lib/ardrone_tool/Academy/academy.c
  ARDroneLib/Soft/Lib/ardrone_tool/Academy/academy.h
  ARDroneLib/Soft/Lib/ardrone_tool/Academy/academy_download.c
  ARDroneLib/Soft/Lib/ardrone_tool/Academy/academy_download.h
  ARDroneLib/Soft/Lib/ardrone_tool/Academy/academy_stage_recorder.c
  ARDroneLib/Soft/Lib/ardrone_tool/Academy/academy_stage_recorder.h
  ARDroneLib/Soft/Lib/ardrone_tool/Academy/academy_upload.c
  ARDroneLib/Soft/Lib/ardrone_tool/Academy/academy_upload.h
  ARDroneLib/Soft/Lib/ardrone_tool/Com/config_com.h
  # ARDroneLib/Soft/Lib/ardrone_tool/Com/config_serial.c
  # ARDroneLib/Soft/Lib/ardrone_tool/Com/config_serial.h
  ARDroneLib/Soft/Lib/ardrone_tool/Com/config_wifi.c
  ARDroneLib/Soft/Lib/ardrone_tool/Com/config_wifi.h
  ARDroneLib/Soft/Lib/ardrone_tool/Control/ardrone_control.c
  ARDroneLib/Soft/Lib/ardrone_tool/Control/ardrone_control.h
  ARDroneLib/Soft/Lib/ardrone_tool/Control/ardrone_control_ack.c
  ARDroneLib/Soft/Lib/ardrone_tool/Control/ardrone_control_ack.h
  ARDroneLib/Soft/Lib/ardrone_tool/Control/ardrone_control_configuration.c
  ARDroneLib/Soft/Lib/ardrone_tool/Control/ardrone_control_configuration.h
  ARDroneLib/Soft/Lib/ardrone_tool/Control/ardrone_navdata_control.c
  ARDroneLib/Soft/Lib/ardrone_tool/Control/ardrone_navdata_control.h
  ARDroneLib/Soft/Lib/ardrone_tool/Navdata/ardrone_academy_navdata.c
  ARDroneLib/Soft/Lib/ardrone_tool/Navdata/ardrone_academy_navdata.h
  ARDroneLib/Soft/Lib/ardrone_tool/Navdata/ardrone_general_navdata.c
  ARDroneLib/Soft/Lib/ardrone_tool/Navdata/ardrone_general_navdata.h
  ARDroneLib/Soft/Lib/ardrone_tool/Navdata/ardrone_navdata_client.c
  ARDroneLib/Soft/Lib/ardrone_tool/Navdata/ardrone_navdata_client.h
  ARDroneLib/Soft/Lib/ardrone_tool/Navdata/ardrone_navdata_file.c
  ARDroneLib/Soft/Lib/ardrone_tool/Navdata/ardrone_navdata_file.h
  ARDroneLib/Soft/Lib/ardrone_tool/Navdata/navdata.c
  ARDroneLib/Soft/Lib/ardrone_tool/UI/ardrone_input.c
  ARDroneLib/Soft/Lib/ardrone_tool/UI/ardrone_input.h
  ARDroneLib/Soft/Lib/ardrone_tool/Video/buffer_to_picture_stage.c
  ARDroneLib/Soft/Lib/ardrone_tool/Video/buffer_to_picture_stage.h
  # ARDroneLib/Soft/Lib/ardrone_tool/Video/mjpeg_stage_decode.c
  # ARDroneLib/Soft/Lib/ardrone_tool/Video/mjpeg_stage_decode.h
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_com_stage.c
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_com_stage.h
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_encapsulation.c
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_navdata_handler.c
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_navdata_handler.h
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_recorder_pipeline.c
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_recorder_pipeline.h
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage.c
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage.h
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage_decoder.c
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage_decoder.h
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage_encoded_recorder.c
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage_encoded_recorder.h
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage_ffmpeg_decoder.c
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage_ffmpeg_decoder.h
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage_ffmpeg_recorder.c
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage_ffmpeg_recorder.h
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage_ittiam_decoder.c
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage_ittiam_decoder.h
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage_latency_estimation.c
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage_latency_estimation.h
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage_merge_slices.c
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage_merge_slices.h
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage_recorder.c
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage_recorder.h
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage_tcp.c
  ARDroneLib/Soft/Lib/ardrone_tool/Video/video_stage_tcp.h
  # ARDroneLib/Soft/Lib/ardrone_tool/Video/vlib_stage_decode.c
  # ARDroneLib/Soft/Lib/ardrone_tool/Video/vlib_stage_decode.h
  ARDroneLib/Soft/Lib/ardrone_tool/ardrone_api.c
  ARDroneLib/Soft/Lib/ardrone_tool/ardrone_tool.c
  ARDroneLib/Soft/Lib/ardrone_tool/ardrone_tool.h
  ARDroneLib/Soft/Lib/ardrone_tool/ardrone_tool_configuration.c
  ARDroneLib/Soft/Lib/ardrone_tool/ardrone_tool_configuration.h
  ARDroneLib/Soft/Lib/ardrone_tool/ardrone_version.c
  ARDroneLib/Soft/Lib/ardrone_tool/ardrone_version.h
  ARDroneLib/Soft/Lib/ardrone_tool/config_keys.c
)

target_include_directories (ardrone_tool PUBLIC ${FFMPEG_INCLUDE_DIRS})
target_link_libraries (ardrone_tool PUBLIC Soft iniparser ${FFMPEG_LIBRARIES})
set_property (TARGET ardrone_tool APPEND PROPERTY INCLUDE_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}/ARDroneLib/Soft/Lib)

add_library (iniparser
  ARDroneLib/Soft/Lib/iniparser3.0b/src/dictionary.c
  ARDroneLib/Soft/Lib/iniparser3.0b/src/dictionary.h
  ARDroneLib/Soft/Lib/iniparser3.0b/src/iniparser.c
  ARDroneLib/Soft/Lib/iniparser3.0b/src/iniparser.h
  #ARDroneLib/Soft/Lib/iniparser3.0b/test/iniexample.c
  #ARDroneLib/Soft/Lib/iniparser3.0b/test/parse.c
)

set_property (TARGET iniparser APPEND PROPERTY INCLUDE_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}/ARDroneLib/Soft/Lib)

target_link_libraries (iniparser PRIVATE VP_SDK)

add_library (Soft
  ARDroneLib/Soft/Common/academy_common.h
  ARDroneLib/Soft/Common/ardrone_api.h
  ARDroneLib/Soft/Common/ardrone_common_config.h
  ARDroneLib/Soft/Common/at_msgs.h
  ARDroneLib/Soft/Common/at_msgs_ids.h
  ARDroneLib/Soft/Common/config.h
  ARDroneLib/Soft/Common/config_keys.h
  ARDroneLib/Soft/Common/control_states.h
  ARDroneLib/Soft/Common/led_animation.h
  ARDroneLib/Soft/Common/navdata_common.h
  ARDroneLib/Soft/Common/navdata_keys.h
  ARDroneLib/Soft/Common/video_encapsulation.h
  ARDroneLib/Soft/Common/vision_common.h
  ARDroneLib/Soft/Lib/Maths/filter.c
  ARDroneLib/Soft/Lib/Maths/filter.h
  ARDroneLib/Soft/Lib/Maths/maths.c
  ARDroneLib/Soft/Lib/Maths/maths.h
  ARDroneLib/Soft/Lib/Maths/matrices.c
  ARDroneLib/Soft/Lib/Maths/matrices.h
  ARDroneLib/Soft/Lib/Maths/matrix3d.c
  ARDroneLib/Soft/Lib/Maths/matrix3d.h
  ARDroneLib/Soft/Lib/Maths/point3d.h
  ARDroneLib/Soft/Lib/Maths/quaternions.c
  ARDroneLib/Soft/Lib/Maths/quaternions.h
  ARDroneLib/Soft/Lib/Maths/time.c
  ARDroneLib/Soft/Lib/Maths/time.h
  ARDroneLib/Soft/Lib/Maths/vision_math.c
  ARDroneLib/Soft/Lib/Maths/vision_math.h
  ARDroneLib/Soft/Lib/utils/AR_Ftw.c
  ARDroneLib/Soft/Lib/utils/AR_Ftw.h
  ARDroneLib/Soft/Lib/utils/ardrone_crc_32.c
  ARDroneLib/Soft/Lib/utils/ardrone_crc_32.h
  ARDroneLib/Soft/Lib/utils/ardrone_date.c
  ARDroneLib/Soft/Lib/utils/ardrone_date.h
  ARDroneLib/Soft/Lib/utils/ardrone_ftp.c
  ARDroneLib/Soft/Lib/utils/ardrone_ftp.h
  ARDroneLib/Soft/Lib/utils/ardrone_gen_ids.c
  ARDroneLib/Soft/Lib/utils/ardrone_gen_ids.h
  ARDroneLib/Soft/Lib/utils/ardrone_time.c
  ARDroneLib/Soft/Lib/utils/ardrone_time.h
  ARDroneLib/Soft/Lib/utils/ardrone_video_atoms.c
  ARDroneLib/Soft/Lib/utils/ardrone_video_atoms.h
  ARDroneLib/Soft/Lib/utils/ardrone_video_encapsuler.c
  ARDroneLib/Soft/Lib/utils/ardrone_video_encapsuler.h
)

set_property (TARGET Soft APPEND PROPERTY INCLUDE_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}/ARDroneLib/VP_SDK)
set_property (TARGET Soft APPEND PROPERTY INCLUDE_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}/ARDroneLib/Soft/Lib)
set_property (TARGET Soft APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
  ${CMAKE_CURRENT_SOURCE_DIR}/ARDroneLib/Soft/Common)
set_property (TARGET Soft APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES
  ${CMAKE_CURRENT_SOURCE_DIR}/ARDroneLib/Soft/Lib)

target_link_libraries (Soft PUBLIC VP_SDK VLIB)

add_library (VLIB
  ARDroneLib/VLIB/P263/p263_codec.c
  ARDroneLib/VLIB/P263/p263_codec.h
  ARDroneLib/VLIB/P263/p263_gob_layer.c
  ARDroneLib/VLIB/P263/p263_huffman.c
  ARDroneLib/VLIB/P263/p263_huffman.h
  ARDroneLib/VLIB/P263/p263_layers.h
  ARDroneLib/VLIB/P263/p263_mb_layer.c
  ARDroneLib/VLIB/P263/p263_picture_layer.c
  ARDroneLib/VLIB/P264/p264.c
  ARDroneLib/VLIB/P264/p264.h
  ARDroneLib/VLIB/P264/p264_Qp.c
  ARDroneLib/VLIB/P264/p264_Qp.h
  ARDroneLib/VLIB/P264/p264_codec.c
  ARDroneLib/VLIB/P264/p264_codec.h
  ARDroneLib/VLIB/P264/p264_common.h
  ARDroneLib/VLIB/P264/p264_gob_layer.c
  ARDroneLib/VLIB/P264/p264_inter_mc.c
  ARDroneLib/VLIB/P264/p264_inter_mc.h
  ARDroneLib/VLIB/P264/p264_intra_pred.c
  ARDroneLib/VLIB/P264/p264_intra_pred.h
  ARDroneLib/VLIB/P264/p264_layers.h
  ARDroneLib/VLIB/P264/p264_mb_layer.c
  ARDroneLib/VLIB/P264/p264_merge.c
  ARDroneLib/VLIB/P264/p264_merge.h
  ARDroneLib/VLIB/P264/p264_picture_layer.c
  ARDroneLib/VLIB/P264/p264_transform.c
  ARDroneLib/VLIB/P264/p264_transform.h
  ARDroneLib/VLIB/P264/p264_zigzag.c
  ARDroneLib/VLIB/P264/p264_zigzag.h
  ARDroneLib/VLIB/P264/video_p264.c
  ARDroneLib/VLIB/P264/video_p264.h
  # ARDroneLib/VLIB/Platform/arm11/UVLC/uvlc_codec.c
  # ARDroneLib/VLIB/Platform/arm11/video_config.h
  # ARDroneLib/VLIB/Platform/arm11/video_utils.c
  # ARDroneLib/VLIB/Platform/arm11/video_utils.h
  # ARDroneLib/VLIB/Platform/arm11/video_utils_iphone.h
  # ARDroneLib/VLIB/Platform/arm9/UVLC/uvlc_mb_layer_p5p.h
  # ARDroneLib/VLIB/Platform/arm9/UVLC/uvlc_p5p.h
  # ARDroneLib/VLIB/Platform/arm9/video_config.h
  # ARDroneLib/VLIB/Platform/arm9/video_dct_p5p.c
  # ARDroneLib/VLIB/Platform/arm9/video_dct_p5p.h
  # ARDroneLib/VLIB/Platform/arm9/video_gen_sad.c
  # ARDroneLib/VLIB/Platform/arm9/video_gen_sad.h
  # ARDroneLib/VLIB/Platform/arm9/video_packetizer_p5p.h
  # ARDroneLib/VLIB/Platform/arm9/video_quantizer_p5p.h
  # ARDroneLib/VLIB/Platform/arm9/video_utils.c
  # ARDroneLib/VLIB/Platform/arm9/video_utils.h
  # ARDroneLib/VLIB/Platform/arm9/video_utils_p5p.h
  # ARDroneLib/VLIB/Platform/arm9_P6/P6_h264_reg.h
  # ARDroneLib/VLIB/Platform/arm9_P6/UVLC/uvlc_mb_layer_p6.c
  # ARDroneLib/VLIB/Platform/arm9_P6/UVLC/uvlc_mb_layer_p6.h
  # ARDroneLib/VLIB/Platform/arm9_P6/UVLC/uvlc_p6.h
  # ARDroneLib/VLIB/Platform/arm9_P6/video_config.h
  # ARDroneLib/VLIB/Platform/arm9_P6/video_dct_p6.c
  # ARDroneLib/VLIB/Platform/arm9_P6/video_dct_p6.h
  # ARDroneLib/VLIB/Platform/arm9_P6/video_p264_p6.c
  # ARDroneLib/VLIB/Platform/arm9_P6/video_p264_p6.h
  # ARDroneLib/VLIB/Platform/arm9_P6/video_packetizer_p6.h
  # ARDroneLib/VLIB/Platform/arm9_P6/video_quantizer_p6.c
  # ARDroneLib/VLIB/Platform/arm9_P6/video_quantizer_p6.h
  # ARDroneLib/VLIB/Platform/arm9_P6/video_utils.c
  # ARDroneLib/VLIB/Platform/arm9_P6/video_utils.h
  # ARDroneLib/VLIB/Platform/arm9_P6/video_utils_p6.h
  ARDroneLib/VLIB/Platform/video_config.h
  ARDroneLib/VLIB/Platform/video_utils.h
  ARDroneLib/VLIB/Platform/x86/UVLC/uvlc_codec.c
  ARDroneLib/VLIB/Platform/x86/video_config.h
  ARDroneLib/VLIB/Platform/x86/video_utils.c
  ARDroneLib/VLIB/Platform/x86/video_utils.h
  ARDroneLib/VLIB/Platform/x86/video_utils_x86.h
  ARDroneLib/VLIB/Stages/vlib_stage_decode.c
  ARDroneLib/VLIB/Stages/vlib_stage_decode.h
  ARDroneLib/VLIB/Stages/vlib_stage_encode.c
  ARDroneLib/VLIB/Stages/vlib_stage_encode.h
  ARDroneLib/VLIB/UVLC/uvlc.c
  ARDroneLib/VLIB/UVLC/uvlc.h
  ARDroneLib/VLIB/UVLC/uvlc_codec.c
  ARDroneLib/VLIB/UVLC/uvlc_codec.h
  ARDroneLib/VLIB/UVLC/uvlc_gob_layer.c
  ARDroneLib/VLIB/UVLC/uvlc_layers.h
  ARDroneLib/VLIB/UVLC/uvlc_mb_layer.c
  ARDroneLib/VLIB/UVLC/uvlc_picture_layer.c
  ARDroneLib/VLIB/Utils/video_bin_dct.c
  ARDroneLib/VLIB/Utils/video_bin_dct.h
  ARDroneLib/VLIB/video_codec.c
  ARDroneLib/VLIB/video_codec.h
  ARDroneLib/VLIB/video_controller.c
  ARDroneLib/VLIB/video_controller.h
  ARDroneLib/VLIB/video_dct.c
  ARDroneLib/VLIB/video_dct.h
  ARDroneLib/VLIB/video_gob.h
  ARDroneLib/VLIB/video_huffman.c
  ARDroneLib/VLIB/video_huffman.h
  ARDroneLib/VLIB/video_macroblock.c
  ARDroneLib/VLIB/video_macroblock.h
  ARDroneLib/VLIB/video_mem32.c
  ARDroneLib/VLIB/video_mem32.h
  ARDroneLib/VLIB/video_packetizer.c
  ARDroneLib/VLIB/video_packetizer.h
  ARDroneLib/VLIB/video_picture.c
  ARDroneLib/VLIB/video_picture.h
  ARDroneLib/VLIB/video_picture_defines.h
  ARDroneLib/VLIB/video_quantizer.c
  ARDroneLib/VLIB/video_quantizer.h
)

target_include_directories (VLIB PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}/ARDroneLib
)

target_compile_definitions (VLIB PUBLIC TARGET_CPU_X86=1 FFMPEG_SUPPORT)

target_link_libraries (VLIB PUBLIC Soft)

# ARDroneLib/VP_SDK/Examples/common/atcodec_client.c
# ARDroneLib/VP_SDK/Examples/common/atcodec_client.h
# ARDroneLib/VP_SDK/Examples/common/atcodec_server.c
# ARDroneLib/VP_SDK/Examples/common/atcodec_server.h
# ARDroneLib/VP_SDK/Examples/common/com_client.c
# ARDroneLib/VP_SDK/Examples/common/com_client.h
# ARDroneLib/VP_SDK/Examples/common/com_server.c
# ARDroneLib/VP_SDK/Examples/common/com_server.h
# ARDroneLib/VP_SDK/Examples/common/common.c
# ARDroneLib/VP_SDK/Examples/common/common.h
# ARDroneLib/VP_SDK/Examples/elinux/api_bluetoothClientTCP_console.c
# ARDroneLib/VP_SDK/Examples/elinux/api_bluetoothClientTCP_ofile.c
# ARDroneLib/VP_SDK/Examples/elinux/api_ifile_upper_ofile.c
# ARDroneLib/VP_SDK/Examples/elinux/api_serial_ofile.c
# ARDroneLib/VP_SDK/Examples/elinux/api_threads.c
# ARDroneLib/VP_SDK/Examples/elinux/api_v4l_raw_ethernet.c
# ARDroneLib/VP_SDK/Examples/elinux/api_v4l_vlib_ethernet.c
# ARDroneLib/VP_SDK/Examples/elinux/api_wifiClientTCP_console.c
# ARDroneLib/VP_SDK/Examples/elinux/atcodec_client.c
# ARDroneLib/VP_SDK/Examples/elinux/atcodec_server.c
# ARDroneLib/VP_SDK/Examples/elinux/atcodec_sorted_list.c
# ARDroneLib/VP_SDK/Examples/elinux/v4l_stage.c
# ARDroneLib/VP_SDK/Examples/linux/api_BTclientTCP_MJPEG_sdl.c
# ARDroneLib/VP_SDK/Examples/linux/api_bluetoothClientTCP_console.c
# ARDroneLib/VP_SDK/Examples/linux/api_bluetoothClientTCP_decoder_sdl.c
# ARDroneLib/VP_SDK/Examples/linux/api_bluetoothClientTCP_ofile.c
# ARDroneLib/VP_SDK/Examples/linux/api_bluetoothClientTCP_raw_sdl.c
# ARDroneLib/VP_SDK/Examples/linux/api_config.c
# ARDroneLib/VP_SDK/Examples/linux/api_encode_decode.c
# ARDroneLib/VP_SDK/Examples/linux/api_ethernet_raw_sdl.c
# ARDroneLib/VP_SDK/Examples/linux/api_ethernet_vlib_sdl.c
# ARDroneLib/VP_SDK/Examples/linux/api_ifile_MJPEG_sdl.c
# ARDroneLib/VP_SDK/Examples/linux/api_ifile_raw_sdl.c
# ARDroneLib/VP_SDK/Examples/linux/api_ifile_upper_ofile.c
# ARDroneLib/VP_SDK/Examples/linux/api_serial_MJPEG_sdl.c
# ARDroneLib/VP_SDK/Examples/linux/api_serial_decoder_sdl.c
# ARDroneLib/VP_SDK/Examples/linux/api_serial_ofile.c
# ARDroneLib/VP_SDK/Examples/linux/api_serial_raw_sdl.c
# ARDroneLib/VP_SDK/Examples/linux/api_threads.c
# ARDroneLib/VP_SDK/Examples/linux/api_v4l_raw_ethernet.c
# ARDroneLib/VP_SDK/Examples/linux/api_v4l_vlib_ethernet.c
# ARDroneLib/VP_SDK/Examples/linux/api_wifiClientTCP_MJPEG_sdl.c
# ARDroneLib/VP_SDK/Examples/linux/api_wifiClientTCP_console.c
# ARDroneLib/VP_SDK/Examples/linux/api_wifiClientTCP_decoder_sdl.c
# ARDroneLib/VP_SDK/Examples/linux/api_wifiClientTCP_raw_sdl.c
# ARDroneLib/VP_SDK/Examples/linux/atcodec_client.c
# ARDroneLib/VP_SDK/Examples/linux/atcodec_server.c
# ARDroneLib/VP_SDK/Examples/linux/atcodec_sorted_list.c
# ARDroneLib/VP_SDK/Examples/linux/client.c
# ARDroneLib/VP_SDK/Examples/linux/com.c
# ARDroneLib/VP_SDK/Examples/linux/server.c
# ARDroneLib/VP_SDK/Examples/linux/wifi.c
# ARDroneLib/VP_SDK/Examples/nds/atcodec_client.c
# ARDroneLib/VP_SDK/Examples/nds/hello_world.c
# ARDroneLib/VP_SDK/Examples/win32/api_ifile_raw_sdl.c
# ARDroneLib/VP_SDK/Examples/win32/mjpeg_decoder.c
# ARDroneLib/VP_SDK/Examples/win32/mjpeg_encoder.c

add_library (VP_SDK
  ARDroneLib/VP_SDK/ATcodec/ATcodec.c
  ARDroneLib/VP_SDK/ATcodec/ATcodec.h
  ARDroneLib/VP_SDK/ATcodec/ATcodec_Buffer.c
  ARDroneLib/VP_SDK/ATcodec/ATcodec_Buffer.h
  ARDroneLib/VP_SDK/ATcodec/ATcodec_Error.h
  ARDroneLib/VP_SDK/ATcodec/ATcodec_Memory.c
  ARDroneLib/VP_SDK/ATcodec/ATcodec_Memory.h
  ARDroneLib/VP_SDK/ATcodec/ATcodec_Messages_ex.h
  ARDroneLib/VP_SDK/ATcodec/ATcodec_Sorted_List.c
  ARDroneLib/VP_SDK/ATcodec/ATcodec_Sorted_List.h
  ARDroneLib/VP_SDK/ATcodec/ATcodec_Tree.c
  ARDroneLib/VP_SDK/ATcodec/ATcodec_Tree.h
  ARDroneLib/VP_SDK/ATcodec/ATcodec_api.c
  ARDroneLib/VP_SDK/ATcodec/ATcodec_api.h
  ARDroneLib/VP_SDK/VP_Api/vp_api.c
  ARDroneLib/VP_SDK/VP_Api/vp_api.h
  ARDroneLib/VP_SDK/VP_Api/vp_api_config.h
  ARDroneLib/VP_SDK/VP_Api/vp_api_error.c
  ARDroneLib/VP_SDK/VP_Api/vp_api_error.h
  ARDroneLib/VP_SDK/VP_Api/vp_api_io_multi_stage.c
  ARDroneLib/VP_SDK/VP_Api/vp_api_io_multi_stage.h
  ARDroneLib/VP_SDK/VP_Api/vp_api_io_stage_selector.h
  ARDroneLib/VP_SDK/VP_Api/vp_api_picture.c
  ARDroneLib/VP_SDK/VP_Api/vp_api_picture.h
  ARDroneLib/VP_SDK/VP_Api/vp_api_stage.c
  ARDroneLib/VP_SDK/VP_Api/vp_api_stage.h
  ARDroneLib/VP_SDK/VP_Api/vp_api_supervisor.c
  ARDroneLib/VP_SDK/VP_Api/vp_api_supervisor.h
  ARDroneLib/VP_SDK/VP_Api/vp_api_thread_helper.c
  ARDroneLib/VP_SDK/VP_Api/vp_api_thread_helper.h
  # ARDroneLib/VP_SDK/VP_Com/elinux/vp_com.c
  # ARDroneLib/VP_SDK/VP_Com/elinux/vp_com_config_itf.c
  # ARDroneLib/VP_SDK/VP_Com/elinux/vp_com_config_itf.h
  # ARDroneLib/VP_SDK/VP_Com/elinux/vp_com_interface.c
  # ARDroneLib/VP_SDK/VP_Com/elinux/vp_com_interface.h
  # ARDroneLib/VP_SDK/VP_Com/elinux/vp_com_serial.c
  # ARDroneLib/VP_SDK/VP_Com/elinux/vp_com_wifi.c
  # ARDroneLib/VP_SDK/VP_Com/elinux/vp_com_wired.c
  # ARDroneLib/VP_SDK/VP_Com/elinux/vp_com_wlc.c
  # ARDroneLib/VP_SDK/VP_Com/elinux/vp_com_wlc.h
  # ARDroneLib/VP_SDK/VP_Com/linux/bluez.c
  # ARDroneLib/VP_SDK/VP_Com/linux/bluez.h
  ARDroneLib/VP_SDK/VP_Com/linux/vp_com.c
  # ARDroneLib/VP_SDK/VP_Com/linux/vp_com_bluetooth.c
  ARDroneLib/VP_SDK/VP_Com/linux/vp_com_config_itf.c
  ARDroneLib/VP_SDK/VP_Com/linux/vp_com_config_itf.h
  ARDroneLib/VP_SDK/VP_Com/linux/vp_com_serial.c
  ARDroneLib/VP_SDK/VP_Com/linux/vp_com_wifi.c
  ARDroneLib/VP_SDK/VP_Com/linux/vp_com_wired.c
  #ARDroneLib/VP_SDK/VP_Com/nds/vp_com.c
  ARDroneLib/VP_SDK/VP_Com/vp_com.h
  #ARDroneLib/VP_SDK/VP_Com/vp_com_bluetooth.h
  ARDroneLib/VP_SDK/VP_Com/vp_com_error.c
  ARDroneLib/VP_SDK/VP_Com/vp_com_error.h
  ARDroneLib/VP_SDK/VP_Com/vp_com_serial.h
  ARDroneLib/VP_SDK/VP_Com/vp_com_socket.c
  ARDroneLib/VP_SDK/VP_Com/vp_com_socket.h
  ARDroneLib/VP_SDK/VP_Com/vp_com_socket_utils.c
  ARDroneLib/VP_SDK/VP_Com/vp_com_wifi.h
  ARDroneLib/VP_SDK/VP_Com/vp_com_wired.h
# ARDroneLib/VP_SDK/VP_Com/win32/vp_com.c
# ARDroneLib/VP_SDK/VP_Com/win32/vp_com_config_itf.c
# ARDroneLib/VP_SDK/VP_Com/win32/vp_com_config_itf.h
# ARDroneLib/VP_SDK/VP_Com/win32/vp_com_serial.c
# ARDroneLib/VP_SDK/VP_Com/win32/vp_com_socket.c
# ARDroneLib/VP_SDK/VP_Com/win32/vp_com_socket_utils.c
# ARDroneLib/VP_SDK/VP_Com/win32/vp_com_wifi.c
# ARDroneLib/VP_SDK/VP_Os/elinux/intrin.h
# ARDroneLib/VP_SDK/VP_Os/elinux/vp_os_delay.c
# ARDroneLib/VP_SDK/VP_Os/elinux/vp_os_ltt.c
# ARDroneLib/VP_SDK/VP_Os/elinux/vp_os_ltt.h
# ARDroneLib/VP_SDK/VP_Os/elinux/vp_os_serial.h
# ARDroneLib/VP_SDK/VP_Os/elinux/vp_os_signal.c
# ARDroneLib/VP_SDK/VP_Os/elinux/vp_os_signal_dep.h
# ARDroneLib/VP_SDK/VP_Os/elinux/vp_os_thread.c
# ARDroneLib/VP_SDK/VP_Os/elinux/vp_os_thread_dep.h
  ARDroneLib/VP_SDK/VP_Os/linux/intrin.h
  ARDroneLib/VP_SDK/VP_Os/linux/vp_os_delay.c
  ARDroneLib/VP_SDK/VP_Os/linux/vp_os_serial.h
  ARDroneLib/VP_SDK/VP_Os/linux/vp_os_signal.c
  ARDroneLib/VP_SDK/VP_Os/linux/vp_os_signal_dep.h
  ARDroneLib/VP_SDK/VP_Os/linux/vp_os_thread.c
  ARDroneLib/VP_SDK/VP_Os/linux/vp_os_thread_dep.h
  # ARDroneLib/VP_SDK/VP_Os/nds/vp_os_delay.c
  # ARDroneLib/VP_SDK/VP_Os/nds/vp_os_signal.c
  # ARDroneLib/VP_SDK/VP_Os/nds/vp_os_signal_dep.h
  # ARDroneLib/VP_SDK/VP_Os/nds/vp_os_thread.c
  # ARDroneLib/VP_SDK/VP_Os/nds/vp_os_thread_dep.h
  # ARDroneLib/VP_SDK/VP_Os/parrotos/default_config.h
  # ARDroneLib/VP_SDK/VP_Os/parrotos/intrin.h
  # ARDroneLib/VP_SDK/VP_Os/parrotos/vp_os_delay.c
  # ARDroneLib/VP_SDK/VP_Os/parrotos/vp_os_serial.h
  # ARDroneLib/VP_SDK/VP_Os/parrotos/vp_os_signal.c
  # ARDroneLib/VP_SDK/VP_Os/parrotos/vp_os_signal_dep.h
  # ARDroneLib/VP_SDK/VP_Os/parrotos/vp_os_thread.c
  # ARDroneLib/VP_SDK/VP_Os/parrotos/vp_os_thread_dep.h
  ARDroneLib/VP_SDK/VP_Os/syslog.h
  ARDroneLib/VP_SDK/VP_Os/vp_os.h
  ARDroneLib/VP_SDK/VP_Os/vp_os_assert.h
  ARDroneLib/VP_SDK/VP_Os/vp_os_delay.h
  ARDroneLib/VP_SDK/VP_Os/vp_os_error_handling.c
  ARDroneLib/VP_SDK/VP_Os/vp_os_error_handling.h
  ARDroneLib/VP_SDK/VP_Os/vp_os_malloc.c
  ARDroneLib/VP_SDK/VP_Os/vp_os_malloc.h
  ARDroneLib/VP_SDK/VP_Os/vp_os_print.h
  ARDroneLib/VP_SDK/VP_Os/vp_os_rtmon.h
  ARDroneLib/VP_SDK/VP_Os/vp_os_signal.h
  ARDroneLib/VP_SDK/VP_Os/vp_os_thread.h
  ARDroneLib/VP_SDK/VP_Os/vp_os_types.h
# ARDroneLib/VP_SDK/VP_Os/win32/intrin.h
# ARDroneLib/VP_SDK/VP_Os/win32/vp_os_delay.c
# ARDroneLib/VP_SDK/VP_Os/win32/vp_os_serial.h
# ARDroneLib/VP_SDK/VP_Os/win32/vp_os_signal.c
# ARDroneLib/VP_SDK/VP_Os/win32/vp_os_signal_dep.h
# ARDroneLib/VP_SDK/VP_Os/win32/vp_os_thread.c
# ARDroneLib/VP_SDK/VP_Os/win32/vp_os_thread_dep.h
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_buffer_to_picture.c
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_buffer_to_picture.h
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_configs.c
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_configs.h
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_frame_pipe.c
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_frame_pipe.h
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_i_camif.h
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_io_buffer.c
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_io_buffer.h
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_io_com.c
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_io_com.h
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_io_console.c
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_io_console.h
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_io_file.c
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_io_file.h
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_o_sdl.c
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_o_sdl.h
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_yuv2rgb.c
  ARDroneLib/VP_SDK/VP_Stages/vp_stages_yuv2rgb.h
)

target_include_directories (VP_SDK
  PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/ARDroneLib/VP_SDK/VP_Com
  PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/ARDroneLib/VP_SDK
  ${CMAKE_CURRENT_SOURCE_DIR}/ARDroneLib/VP_SDK/VP_Os/linux
  ${CMAKE_CURRENT_SOURCE_DIR}/ARDroneLib/VP_SDK/VP_Com/linux
)

target_compile_definitions (VP_SDK PUBLIC USE_LINUX USE_WIFI __LINUX__ FF_API_PIX_FMT=1)

target_link_libraries (VP_SDK PUBLIC Soft ${CMAKE_THREAD_LIBS_INIT})
