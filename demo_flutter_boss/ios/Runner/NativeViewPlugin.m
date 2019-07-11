//
//  NativeViewPlugin.m
//  Runner
//
//  Created by yu qin on 2019/7/11.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "NativeViewPlugin.h"
#import <Runner-Swift.h>


@implementation NativeViewPlugin

+ (void)registerWithRegistry:(nonnull NSObject<FlutterPluginRegistry> *)registry {
    NSString *pluginKey = @"Google_MapView_Plugin";
    if ([registry hasPlugin:pluginKey]) {
        return;
    }
    NSObject<FlutterPluginRegistrar>  *registrar = [registry registrarForPlugin:pluginKey];
    NSObject<FlutterBinaryMessenger> *messenger = [registrar messenger];
    [registrar registerViewFactory:[[ViewFactory alloc] initWithMessenger:messenger] withId:@"TestView"];
    
}

@end
