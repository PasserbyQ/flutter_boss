import 'package:demo_flutter_boss/common/config/config.dart';
import 'package:demo_flutter_boss/widgets/company/company_page.dart';
import 'package:demo_flutter_boss/widgets/job/job_page.dart';
import 'package:demo_flutter_boss/widgets/message/MessagePage.dart';
import 'package:demo_flutter_boss/widgets/my/my_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() {
    // TODO: implement createState
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  final tabTitles = ['职位', '公司', '消息', '我的'];
  final tabTextStyleSelected = new TextStyle(color: Config.GREEN_COLOR);
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));
  final pages = [
    new JobPage(),
    new CompanyPage(),
    new MessagePage(),
    new MyPage()
  ];

  int _tabIndex = 0;
  var _tabImages;

  Image getTabImage(path) {
    return new Image.asset(path, width: 25.0, height: 25.0);
  }

  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return _tabImages[curIndex][1];
    }
    return _tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return new Text(tabTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabImages = [
      [
        getTabImage('images/ic_main_tab_find_nor.png'),
        getTabImage('images/ic_main_tab_find_pre.png')
      ],
      [
        getTabImage('images/ic_main_tab_company_nor.png'),
        getTabImage('images/ic_main_tab_company_pre.png')
      ],
      [
        getTabImage('images/ic_main_tab_contacts_nor.png'),
        getTabImage('images/ic_main_tab_contacts_pre.png')
      ],
      [
        getTabImage('images/ic_main_tab_my_nor.png'),
        getTabImage('images/ic_main_tab_my_pre.png')
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: getAppBar(),
      body: pages[_tabIndex],
      bottomNavigationBar: new CupertinoTabBar(
        items: [
          new BottomNavigationBarItem(
              icon: getTabIcon(0), title: getTabTitle(0)),
          new BottomNavigationBarItem(
              icon: getTabIcon(1), title: getTabTitle(1)),
          new BottomNavigationBarItem(
              icon: getTabIcon(2), title: getTabTitle(2)),
          new BottomNavigationBarItem(
              icon: getTabIcon(3), title: getTabTitle(3)),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

  Widget getAppBar() {

    return null;
    /*
    if (_tabIndex == 3 || _tabIndex == 0) {
      return null;
    }
    return new AppBar(
      title:
          Text(tabTitles[_tabIndex], style: new TextStyle(color: Colors.white)),
    );*/
  }
}
