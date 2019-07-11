import 'package:demo_flutter_boss/common/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCell extends StatelessWidget {

  VoidCallback onPressed;

  MyCell({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        color: Colors.white,
        height: 50,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'images/ic_main_tab_my_nor.png',
                    width: 30,
                    height: 30,
                  ),
                  Container(width: 10),
                  Expanded(
                    child: Text('呵呵'),
                  ),
                  Text('看啥'),
                  Container(width: 10),
                  Text('>'),
                ],
              ),
            ),
            Divider(height: 1, color: Config.LINE_COLOR)
          ],
        ),
      ),
    );
  }
}
