import 'package:demo_flutter_boss/common/config/config.dart';
import 'package:demo_flutter_boss/common/config/urls.dart';
import 'package:demo_flutter_boss/common/utils/http_util.dart';
import 'package:demo_flutter_boss/common/widget/toast.dart';
import 'package:demo_flutter_boss/widgets/job/job.dart';
import 'package:demo_flutter_boss/widgets/job/job_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class JobPage extends StatefulWidget {
  @override
  _JobPageState createState() {
    // TODO: implement createState
    return _JobPageState();
  }
}

class _JobPageState extends State<JobPage> {
  List<Job> jobList = List<Job>();

  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

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

  Widget _createListView(BuildContext context) {
    return EasyRefresh(
      key: _easyRefreshKey,
      firstRefresh: true,
      autoLoad: true,
      behavior: RefreshBehavior(showTrailing: true, showLeading: true),
      refreshHeader: BallPulseHeader(
        key: _headerKey,
        color: Config.GREEN_COLOR,
      ),
      refreshFooter: ClassicsFooter(
        key: _footerKey,
        loadText: '上拉加载',
        loadReadyText: '松手加载',
        loadingText: '正在加载数据',
        loadedText: '加载完成',
        noMoreText: '没有更多数据',
        bgColor: Colors.transparent,
        textColor: Colors.black87,
        moreInfoColor: Colors.black54,
      ),
      onRefresh: () async {
        await _onRefresh();
      },
      loadMore: () async {
        await _loadMore();
      },
      child: ListView.builder(
        itemCount: this.jobList.length,
        itemBuilder: (context, index) {
          return new JobCell(
            job: jobList[index],
            onPressed: () {
              Navigator.pushNamed(context, '/jobDetail');
            },
          );
        },
      ),
    );
  }

  ///request
  _onRefresh() async {
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

  _loadMore() async {
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

    if (this.jobList.length < 5) {
      if (mounted) {
        setState(() {
          this.jobList.addAll(jobList);
        });
      }
    }
  }
}
