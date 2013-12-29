LOCAL_PATH:= $(call my-dir)

# libogg
include $(CLEAR_VARS)

LOCAL_MODULE    := liblove
LOCAL_CFLAGS    := -fexceptions -g -Dlinux -Dunix \
	-DHAVE_GCC_DESTRUCTOR=1 -DOPT_GENERIC -DREAL_IS_FLOAT \
	-DGL_GLEXT_PROTOTYPES

LOCAL_CPPFLAGS  := ${LOCAL_CFLAGS} 

LOCAL_C_INCLUDES  :=  \
	${LOCAL_PATH}/src \
	${LOCAL_PATH}/src/modules \
	${LOCAL_PATH}/src/libraries/ \
	${LOCAL_PATH}/src/libraries/enet/libenet/include \
	${LOCAL_PATH}/../SDL2-2.0.1/include \
	${LOCAL_PATH}/../devil-1.7.8/include \
	${LOCAL_PATH}/../devil-1.7.8/src-IL/include \
	${LOCAL_PATH}/../jasper-1.900.1/src/libjasper/include \
	${LOCAL_PATH}/../libpng-1.5.6/ \
	${LOCAL_PATH}/../libmng-1.0.10/ \
	${LOCAL_PATH}/../jpeg-8c/ \
	${LOCAL_PATH}/../lcms2-2.2/include \
	${LOCAL_PATH}/../tiff-3.9.5/libtiff \
	${LOCAL_PATH}/../openal-soft-android/include \
	${LOCAL_PATH}/../openal-soft-android/OpenAL32/Include \
	${LOCAL_PATH}/../freetype2-android/include \
	${LOCAL_PATH}/../freetype2-android/src \
	${LOCAL_PATH}/../physfs-2.0.3 \
	${LOCAL_PATH}/../mpg123-1.13.4/src/libmpg123 \
	${LOCAL_PATH}/../libmodplug-0.8.8.4/src \
	${LOCAL_PATH}/../libvorbis-1.3.2/include \
	${LOCAL_PATH}/../lua-5.1.4/src \
	${LOCAL_PATH}/../libogg-1.3.0/include 
		
LOCAL_SRC_FILES := \
	$(filter-out \
	  src/libraries/luasocket/libluasocket/wsocket.c \
	,$(subst $(LOCAL_PATH)/,,\
	$(wildcard ${LOCAL_PATH}/src/love.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/common/*.cpp) \
	$(wildcard ${LOCAL_PATH}/src/modules/audio/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/audio/null/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/audio/openal/*.cpp) \
	$(wildcard ${LOCAL_PATH}/src/modules/event/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/event/sdl/*.cpp) \
	$(wildcard ${LOCAL_PATH}/src/modules/filesystem/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/filesystem/physfs/*.cpp) \
	$(wildcard ${LOCAL_PATH}/src/modules/font/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/font/freetype/*.cpp) \
	$(wildcard ${LOCAL_PATH}/src/modules/graphics/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/graphics/opengl/*.cpp) \
	$(wildcard ${LOCAL_PATH}/src/modules/image/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/image/magpie/*.cpp) \
	$(wildcard ${LOCAL_PATH}/src/modules/joystick/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/joystick/sdl/*.cpp) \
	$(wildcard ${LOCAL_PATH}/src/modules/keyboard/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/keyboard/sdl/*.cpp) \
	$(wildcard ${LOCAL_PATH}/src/modules/love/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/math/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/mouse/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/mouse/sdl/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/physics/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/physics/box2d/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/sound/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/sound/lullaby/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/system/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/system/sdl/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/thread/*.cpp) \
 	$(wildcard ${LOCAL_PATH}/src/modules/thread/sdl/*.cpp) \
  $(wildcard ${LOCAL_PATH}/src/modules/timer/*.cpp) \
  $(wildcard ${LOCAL_PATH}/src/modules/timer/sdl/*.cpp) \
  $(wildcard ${LOCAL_PATH}/src/modules/window/*.cpp) \
  $(wildcard ${LOCAL_PATH}/src/modules/window/sdl/*.cpp) \
  $(wildcard ${LOCAL_PATH}/src/libraries/ddsparse/*.cpp) \
  $(wildcard ${LOCAL_PATH}/src/libraries/Box2D/*.cpp) \
  $(wildcard ${LOCAL_PATH}/src/libraries/Box2D/Collision/*.cpp) \
  $(wildcard ${LOCAL_PATH}/src/libraries/Box2D/Collision/Shapes/*.cpp) \
  $(wildcard ${LOCAL_PATH}/src/libraries/Box2D/Common/*.cpp) \
  $(wildcard ${LOCAL_PATH}/src/libraries/Box2D/Dynamics/*.cpp) \
  $(wildcard ${LOCAL_PATH}/src/libraries/Box2D/Dynamics/Contacts/*.cpp) \
  $(wildcard ${LOCAL_PATH}/src/libraries/Box2D/Dynamics/Joints/*.cpp) \
  $(wildcard ${LOCAL_PATH}/src/libraries/Box2D/Rope/*.cpp) \
  $(wildcard ${LOCAL_PATH}/src/libraries/glad/*.cpp) \
  $(wildcard ${LOCAL_PATH}/src/libraries/enet/*.cpp) \
  $(wildcard ${LOCAL_PATH}/src/libraries/enet/libenet/*.c) \
  $(wildcard ${LOCAL_PATH}/src/libraries/luasocket/*.cpp) \
  $(wildcard ${LOCAL_PATH}/src/libraries/luasocket/libluasocket/*.c) \
  $(wildcard ${LOCAL_PATH}/src/libraries/noise1234/*.cpp) \
  $(wildcard ${LOCAL_PATH}/src/libraries/Wuff/*.c) \
  ))

LOCAL_CXXFLAGS := -std=c++0x

LOCAL_SHARED_LIBRARIES := SDL2 libphysfs liblua libvorbis libogg  libopenal libmpg123 libmodplug libdevil libtiff libmng libfreetype liblcms libjasper libpng libjpeg 

# $(info liblove: include dirs $(LOCAL_C_INCLUDES))
# $(info liblove: src files $(LOCAL_SRC_FILES))

SDL_PATH := ../SDL2-2.0.1
LOCAL_SRC_FILES += $(SDL_PATH)/src/main/android/SDL_android_main.c 
LOCAL_LDLIBS := -lz -lGLESv1_CM -lGLESv2 -ldl -landroid

include $(BUILD_SHARED_LIBRARY)