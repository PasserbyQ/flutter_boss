//
//  ViewFactory.swift
//  Runner
//
//  Created by yu qin on 2019/7/11.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit
import Flutter

class ViewFactory: NSObject,FlutterPlatformViewFactory {
    
    var messenger: FlutterBinaryMessenger!

    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return TestView(frame,viewID : viewId , args : args,binaryMessenger:messenger);
    }
    
    @objc public init(messenger: (NSObject & FlutterBinaryMessenger)?) {
        super.init()
        self.messenger = messenger
    }
}
