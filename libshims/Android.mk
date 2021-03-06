
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

# Camera
include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
    lg_camera_misc.c
LOCAL_SHARED_LIBRARIES := libutils libgui liblog libbinder
LOCAL_MODULE := libshim_camera
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := DisplayEventReceiver.c
LOCAL_MODULE := libshim_camera_hal
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

# ims
include $(CLEAR_VARS)
LOCAL_SRC_FILES := MediaBuffer.c
LOCAL_SHARED_LIBRARIES := libstagefright_foundation
LOCAL_MODULE := libshims_ims
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

# test
# libcamera_shim
include $(CLEAR_VARS)

LOCAL_SRC_FILES := camera_shim.cpp

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libutils \
    libgui \
    libui

LOCAL_C_INCLUDES := \
    frameworks/native/include

LOCAL_MODULE := libshims_camera
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES

LOCAL_MULTILIB := 32

include $(BUILD_SHARED_LIBRARY)


# qcamera-daemon_shim
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    bionic/bionic_time_conversions.cpp \
    bionic/pthread_cond.cpp

LOCAL_SHARED_LIBRARIES := libc

LOCAL_MODULE := libshims_qcamera-daemon
LOCAL_MODULE_TAGS := optional

LOCAL_MULTILIB := 32

include $(BUILD_SHARED_LIBRARY)
