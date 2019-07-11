//
//  FlutterNativePlugin.m
//  Runner
//
//  Created by yu qin on 2019/7/11.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "FlutterNativePlugin.h"

@implementation FlutterNativePlugin

+ (void)registerWithRegistrar:(nonnull NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"iOS_Method" binaryMessenger:[registrar messenger]];
    
    FlutterNativePlugin *instance = [[FlutterNativePlugin alloc] init];
    
    [registrar addMethodCallDelegate:instance channel:channel];
    
}


- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if ([@"iOS_Print" isEqualToString:call.method]) {
        NSLog(@"调用原生成功。。。");
        result(@"调用原生超简单");
    }
}

@end
