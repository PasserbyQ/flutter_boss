import 'package:flutter/services.dart';

class Events {


  static Future<String> nativePrint() async {
    const platform = const MethodChannel("iOS_Method"); 
    return await platform.invokeMethod('iOS_Print');
  }

}