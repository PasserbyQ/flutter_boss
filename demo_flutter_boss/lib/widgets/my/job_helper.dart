import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class JobHelper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _createContent();
  }

  Widget _createContent() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 20,top: 20 , right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '求职助手',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text('更多>')
              ],
            ),
          ),
          _createSubContent()
        ],
      ),
    );
  }

  Widget _createSubContent() {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _createItem(),
          _createItem(),
          _createItem(),
          _createItem(),
        ],
      ),
    );
  }

  Widget _createItem() {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
// 生成俩层阴影，一层绿，一层黄， 阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
        boxShadow: [
          BoxShadow(
              color: Colors.black.withAlpha(40),
              blurRadius: 10.0,
              spreadRadius: 2.0),
        ],
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(left: 10, right: 10),
      // color: Colors.white,
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '简历刷新',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('简历刷新'),
            ],
          ),
          Container(
            width: 10,
          ),
          Image.asset(
            'images/ic_main_tab_contacts_pre.png',
            width: 40,
            height: 40,
          )
        ],
      ),
    );
  }
}
