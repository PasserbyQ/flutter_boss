//
//  NativeViewPlugin.h
//  Runner
//
//  Created by yu qin on 2019/7/11.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface NativeViewPlugin : NSObject
+ (void)registerWithRegistry:(nonnull NSObject<FlutterPluginRegistry> *)registry;
@end

NS_ASSUME_NONNULL_END
