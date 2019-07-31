import 'package:demo_flutter_boss/common/config/config.dart';
import 'package:flutter/material.dart';

import 'chat_right_message.dart';
import 'chat_left_message.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChatScreenState();
  }
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final List<Widget> _messages = <Widget>[];

  @override
  void dispose() {
    // TODO: implement dispose
    _textController.dispose();
    for (ChatRightMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("聊天"),
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              Flexible(
                child: ListView.builder(
                  padding: new EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (_, int index) => _messages[index],
                  itemCount: _messages.length,
                ),
              ),
              new Divider(height: 1.0),
              new Container(
                decoration: new BoxDecoration(
                  color: Theme.of(context).cardColor,
                ),
                child: _buildTextComposer(),
              )
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
                  border:
                      new Border(top: new BorderSide(color: Colors.grey[200])))
              : null),
    );
  }

  Widget _buildTextComposer() {
    return new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(children: <Widget>[
          new Flexible(
              child: new TextField(
            controller: _textController,
            onSubmitted: _handleSubmitted,
            decoration: new InputDecoration.collapsed(hintText: '发送消息'),
          )),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
                icon: new Icon(
                  Icons.send,
                  color: Config.GREEN_COLOR,
                ),
                onPressed: () => _handleSubmitted(_textController.text)),
          )
        ]));
  }

  void _handleSubmitted(String text) {
    _textController.clear();

    ChatRightMessage message1 = new ChatRightMessage(
        text: text,
        animationController: new AnimationController(
            duration: new Duration(milliseconds: 700), vsync: this));

    ChatLeftMessage message2 = new ChatLeftMessage(
        text: text,
        animationController: new AnimationController(
            duration: new Duration(milliseconds: 700), vsync: this));

    setState(() {
      _messages.insert(0, message1);
      _messages.insert(0, message2);
    });
    message1.animationController.forward();
    message2.animationController.forward();
  }
}
