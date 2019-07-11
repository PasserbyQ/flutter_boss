import 'package:demo_flutter_boss/common/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          'http://pic41.nipic.com/20140514/5295460_234432363121_2.jpg'),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('公司名'),
                  Text(
                    '公司地址',
                    style: TextStyle(color: Config.GRAY_COLOR, fontSize: 12.0),
                  )
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2.0),
            child: Text('描述'),
            decoration: BoxDecoration(
                color: new Color(0xFFF6F6F8),
                borderRadius: BorderRadius.all(Radius.circular(2.0))),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            color: Config.LINE_COLOR,
            height: 1,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Text('热招：', style: TextStyle(color: Config.GRAY_COLOR)),
                    Text('iOS开发工程师',
                        style: TextStyle(color: Config.GREEN_COLOR)),
                    Text('等326个职位', style: TextStyle(color: Config.GRAY_COLOR))
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                width: 20.0,
                child: Text('>'),
              )
            ],
          )
        ],
      ),
    );
  }
}
