import 'package:demo_flutter_boss/common/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JobDetailHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _createHeader();
  }

  ///职位信息
  Widget _createHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'iOS开发工程师',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              Text('20k-25k',
                  style: TextStyle(fontSize: 14.0, color: Config.GREEN_COLOR))
            ],
          ),
          Container(height: 20),
          Row(
            children: <Widget>[
              Image.asset(
                'images/ic_main_tab_contacts_nor.png',
                width: 20,
                height: 20,
              ),
              Text('上海-浦东'),
              Container(
                width: 10,
              ),
              Image.asset(
                'images/ic_main_tab_contacts_nor.png',
                width: 20,
                height: 20,
              ),
              Text('3-5年'),
              Container(
                width: 10,
              ),
              Image.asset(
                'images/ic_main_tab_contacts_nor.png',
                width: 20,
                height: 20,
              ),
              Text('本科'),
            ],
          ),
          Container(height: 20),
          Divider(
            height: 1,
            color: Config.LINE_COLOR,
          ),
          _createPublisher(),
          _createNative()
        ],
      ),
    );
  }

  ///发布者信息
  Widget _createPublisher() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          'http://pic41.nipic.com/20140514/5295460_234432363121_2.jpg'),
                    )),
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
                        Text('发布者'),
                        Container(
                          width: 5.0,
                        ),
                        Text(
                          '刚刚活跃',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.black.withOpacity(0.3)),
                        )
                      ],
                    ),
                    Container(height: 5.0),
                    Text(
                      'HR',
                      style:
                          TextStyle(color: Config.GRAY_COLOR, fontSize: 12.0),
                    )
                  ],
                ),
              ),
              Text('>')
            ],
          ),
          Container(height: 20),
          Divider(
            height: 1,
            color: Config.LINE_COLOR,
          ),
        ],
      ),
    );
  }

  ///发布者信息
  Widget _createNative() {
    return Container(
        height: 100,
        child: UiKitView(
          viewType: 'TestView',
        ));
  }
}
