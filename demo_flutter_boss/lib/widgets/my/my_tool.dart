import 'package:flutter/widgets.dart';

class JobTool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _createContent();
  }

  Widget _createContent() {
    return Container(
      width: 100,
      height: 60,
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('简历刷新'),
              Text('提升简历活跃'),
            ],
          ),
          Image.asset('iamges/ic_main_tab_contacts_pre.png')
        ],
      ),
    );
  }
}
