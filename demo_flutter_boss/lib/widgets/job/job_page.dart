import 'package:demo_flutter_boss/common/config/config.dart';
import 'package:demo_flutter_boss/common/config/urls.dart';
import 'package:demo_flutter_boss/common/utils/http_util.dart';
import 'package:demo_flutter_boss/common/widget/toast.dart';
import 'package:demo_flutter_boss/widgets/job/job.dart';
import 'package:demo_flutter_boss/widgets/job/job_cell.dart';
import 'package:flutter/material.dart';

class JobPage extends StatefulWidget {
  @override
  _JobPageState createState() {
    // TODO: implement createState
    return _JobPageState();
  }
}

class _JobPageState extends State<JobPage> {
  List<Job> jobList = List<Job>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text('职 位',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
      ),
      body: _createListView(context),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _jobList();
  }

  Widget _createListView(BuildContext context) {
    return ListView.builder(
      itemCount: this.jobList.length,
      itemBuilder: (context, index) {
        return new JobCell(
          job: jobList[index],
          onPressed: () {
            Navigator.pushNamed(context, '/jobDetail');
          },
        );
      },
    );
  }

  ///request
  _jobList() async {
    var result = await HttpUtil.request(Url.JOBS_URL);

    List<Job> jobList = List<Job>();
    if (result != null &&
        result.containsKey('statusCode') &&
        result['statusCode'] == 200) {
      for (dynamic data in result['data']) {
        Job jobData = Job.fromJson(data);
        jobList.add(jobData);
      }
    }

    if (mounted) {
      setState(() {
        this.jobList = jobList;
      });
    }
  }
}
