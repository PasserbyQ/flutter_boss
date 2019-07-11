import 'package:demo_flutter_boss/common/config/config.dart';
import 'package:demo_flutter_boss/common/events/events.dart';
import 'package:demo_flutter_boss/common/widget/toast.dart';
import 'package:demo_flutter_boss/widgets/my/my_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:barcode_scan/barcode_scan.dart';

import 'job_helper.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() {
    // TODO: implement createState
    return _MyPageState();
  }
}

class _MyPageState extends State<MyPage> {
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text('我的',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        actions: <Widget>[
          CupertinoButton(
            child: Image.asset('images/ic_main_tab_find_nor.png'),
            onPressed: () {
              scan();
            },
          )
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[_createHeadView(), JobHelper()],
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(_buildListItem, childCount: 2),
            itemExtent: 50.0,
          )
        ],
      ),
    );
  }

  Widget _createHeadView() {
    return new Container(
      height: 180,
      color: Config.GREEN_COLOR,
      padding: const EdgeInsets.fromLTRB(30, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('姓名',
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  Text('我的简历>', style: TextStyle(color: Colors.white))
                ],
              )),
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'http://pic41.nipic.com/20140514/5295460_234432363121_2.jpg'),
              )
            ],
          ),
          Container(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _headItem('1', '待沟通'),
                _headItem('4', '待面试'),
                _headItem('60', '已投简历'),
                _headItem('15', '收藏')
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _headItem(String number, String title) {
    return Container(
      // height: 50.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(number,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold)),
          Text(title, style: TextStyle(color: Colors.white, fontSize: 14.0))
        ],
      ),
    );
  }

// 列表项
  Widget _buildListItem(BuildContext context, int index) {
    return new MyCell(onPressed: () {
      Events.nativePrint().then((info) {
      Toast.show(info, context);
      });
    });
  }

  ///扫描
  scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        return this.barcode = barcode;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          return this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() {
          return this.barcode = 'Unknown error: $e';
        });
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
