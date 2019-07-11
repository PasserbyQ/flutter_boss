import 'package:demo_flutter_boss/common/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.fromLTRB(30, 20, 20, 0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'http://pic41.nipic.com/20140514/5295460_234432363121_2.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(flex: 1, child: Text('ZTO-招聘者')),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '2019-07-07',
                            style: TextStyle(
                                color: Config.GRAY_COLOR, fontSize: 12.0),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '考虑的怎么样',
                      style:
                          TextStyle(color: Config.GRAY_COLOR, fontSize: 12.0),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(padding: const EdgeInsets.only(bottom: 20.0)),
          Container(
            height: 1,
            color: Config.LINE_COLOR,
          )
        ],
      ),
    );
  }
}
