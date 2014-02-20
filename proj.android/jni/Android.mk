LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := cocos2dcpp_shared

LOCAL_MODULE_FILENAME := libcocos2dcpp

# ����Ŀ¼����Ŀ¼�ĺ��� 
define walk 
$(wildcard $(1)) $(foreach e, $(wildcard $(1)/*), $(call walk, $(e))) 
endef 

# ����ClassesĿ¼ 
ALLFILES = $(call walk, $(LOCAL_PATH)/../../Classes) 
FILE_LIST := hellocpp/main.cpp 

# �������ļ�����ȡ������.cpp�ļ� 
FILE_LIST += $(filter %.cpp, $(ALLFILES)) 

LOCAL_SRC_FILES := $(FILE_LIST:$(LOCAL_PATH)/%=%) 
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../Classes

LOCAL_WHOLE_STATIC_LIBRARIES := cocos2dx_static
LOCAL_WHOLE_STATIC_LIBRARIES += cocosdenshion_static

include $(BUILD_SHARED_LIBRARY)

$(call import-module,2d)
$(call import-module,audio/android)
