import 'dart:async';

import 'package:demo_flutter_boss/common/config/config.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  Timer _countdownTimer;
  int _countdownCount = 2;

  List<String> _guideList = [
    'images/ic_splash_bg.png',
    'images/ic_splash_bg.png',
    'images/ic_splash_bg.png',
  ];

  List<Widget> _guideWidgeList = List();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _initSplash();
  }

  /// 初始化启动图
  Widget _initSplash() {
    _initCountdown();
    return Image.asset(
      'images/ic_splash_bg.png',
      fit: BoxFit.fill,
      width: double.infinity,
      height: double.infinity,
    );
  }

  /// 初始化定时器
  void _initCountdown() {
    if (_countdownTimer != null) {
      return;
    }
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (this._countdownCount > 0) {
          this._countdownCount--;
        } else {
          _countdownTimer.cancel();
          _countdownTimer = null;
          Navigator.of(context).pushReplacementNamed('/main');
        }
      });
    });
  }

  /// 初始化引导页
  void _initGuide() {
    for (int i = 0, length = _guideList.length; i < length; i++) {
      if (i == length - 1) {
        Widget w = Stack(
          children: <Widget>[
            Image.asset(
              'images/ic_splash_bg.png',
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 120,
                  height: 40,
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.only(bottom: 100),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: new Text(
                    '立即体验',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
            )
          ],
        );

        _guideWidgeList.add(w);
      } else {
        _guideWidgeList.add(new Image.asset(
          _guideList[i],
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ));
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }
}
