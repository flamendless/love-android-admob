LOCAL_PATH:= $(call my-dir)

# libogg
include $(CLEAR_VARS)

LOCAL_MODULE    := liblcms
LOCAL_CFLAGS    := -fexceptions -g -Dlinux -Dunix \
	-DHAVE_GCC_DESTRUCTOR=1 -DOPT_GENERIC -DREAL_IS_FLOAT 

LOCAL_CPPFLAGS  := ${LOCAL_CFLAGS}

LOCAL_C_INCLUDES  :=  \
	${LOCAL_PATH}/include 
		
LOCAL_SRC_FILES := \
	$(filter-out \
	,$(subst $(LOCAL_PATH)/,,\
	$(wildcard ${LOCAL_PATH}/src/*.c) ))

$(info liblcms: include dirs $(LOCAL_C_INCLUDES))
$(info liblcms: src files $(LOCAL_SRC_FILES))

include $(BUILD_STATIC_LIBRARY)
