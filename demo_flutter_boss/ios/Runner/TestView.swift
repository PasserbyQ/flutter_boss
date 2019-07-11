//
//  TestView.swift
//  Runner
//
//  Created by yu qin on 2019/7/11.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit
import Flutter

class TestView: NSObject,FlutterPlatformView {
    
    var frame: CGRect;
    var viewId: Int64 = 0;
    var messenger: FlutterBinaryMessenger!

    var args: Any?

    init(_ frame: CGRect,viewID: Int64,args :Any?, binaryMessenger: FlutterBinaryMessenger) {
        self.frame = frame;
        self.viewId = viewID;
        self.messenger=binaryMessenger;
        
        self.args = args
    }
    
    //方法
    func initMethodChannel(){
        
    }
    
    func view() -> UIView {
        initMethodChannel()
        let mapView = UIView()
        mapView.backgroundColor = UIColor.lightGray
        mapView.frame = frame
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 30))
        label.text = "原生视图"
        label.textColor = UIColor.red
        mapView.addSubview(label)
        return mapView;
    }

}
