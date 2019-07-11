
import 'package:demo_flutter_boss/widgets/job/job_detail_item.dart';
import 'package:flutter/material.dart';

class JobDetailPage extends StatefulWidget {
  
  @override
  _JobDetailPageState createState() {
    // TODO: implement createState
    return _JobDetailPageState();
  }
}

class _JobDetailPageState extends State<JobDetailPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: JobDetailHead(),
    );
  }





}