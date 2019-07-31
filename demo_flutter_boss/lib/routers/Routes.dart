import 'package:demo_flutter_boss/tabs.dart';
import 'package:demo_flutter_boss/widgets/company/company_detail_page.dart';
import 'package:demo_flutter_boss/widgets/job/job_detail_page.dart';
import 'package:demo_flutter_boss/widgets/message/chat_screen.dart';
import 'package:flutter/material.dart';

// 配置路由
final routes = {
  '/main': (context) => Tabs(),
  '/jobDetail': (context) => JobDetailPage(),
  '/companyDetail': (context) => CompanyDetailPage(),
  'chat': (context) => ChatScreen(),
};

//监听处理
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
