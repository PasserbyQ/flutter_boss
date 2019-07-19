import 'package:demo_flutter_boss/blocs/bloc_increment.dart';
import 'package:demo_flutter_boss/blocs/bloc_provider.dart';
import 'package:demo_flutter_boss/common/widget/toast.dart';
import 'package:demo_flutter_boss/widgets/company/company_cell.dart';
import 'package:demo_flutter_boss/widgets/company/company_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() {
    // TODO: implement createState
    return _CompanyPageState();
  }
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text('公司',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
      ),
      body: _createListView(context),
    );
  }

  /**
 *创建listView
 */
  Widget _createListView(BuildContext context) {
    return new ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return CompanyCell(onPressed: () {
            Navigator.push(context,
                new CupertinoPageRoute<void>(builder: (ctx) =>
              BlocProvider<IncrementBloc>(
                bloc: IncrementBloc(),
                child: CompanyDetailPage(),
              )
            ));
            // Navigator.pushNamed(context, '/companyDetail');
          });
        });
  }
}
