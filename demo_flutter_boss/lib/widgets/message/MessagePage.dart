import 'package:demo_flutter_boss/widgets/message/MessageCell.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() {
    // TODO: implement createState
    return _MessagePageState();
  }
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text('消息',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
      ),
      body: _createListView(context),
    );
  }
}

Widget _createListView(BuildContext context) {
  return ListView.builder(
    itemCount: 2,
    itemBuilder: (context,index) {
        return new MessageCell();
    },
  );
}
