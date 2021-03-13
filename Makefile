TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard
THEOS_DEVICE_IP = 192.168.1.28


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WindowExample

WindowExample_FILES = Tweak.xm Window.m
WindowExample_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
