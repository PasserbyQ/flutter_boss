
import 'package:demo_flutter_boss/common/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const String _name = "pq";

class ChatRightMessage extends StatelessWidget {

  const ChatRightMessage({Key key, this.text, this.animationController}) : super(key: key);

  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut
      ),
      axisAlignment: 0.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                new Text(_name, style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text),
                )
              ]
            ),
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(backgroundColor: Config.GREEN_COLOR,child: new Text(_name[0],style: TextStyle(color: Colors.black),)),
            )
            
          ],
        ),
      ),

    );
  }


}