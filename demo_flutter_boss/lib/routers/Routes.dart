import 'package:demo_flutter_boss/widgets/job/job_detail_page.dart';
import 'package:flutter/material.dart';



// 配置路由
final routes = {
    '/jobDetail': (context) => JobDetailPage(),
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
