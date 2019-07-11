import 'package:demo_flutter_boss/common/widget/toast.dart';
import 'package:flutter/material.dart';

import 'job.dart';

class JobCell extends StatelessWidget {
  final Job job;
  VoidCallback onPressed;

  JobCell({Key key, this.job, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: onPressed,
      child: new Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.fromLTRB(18, 18, 10, 18),
        color: Colors.white,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                new Expanded(
                  child: Text(job.job,
                      style: TextStyle(color: Colors.black, fontSize: 16.0)),
                ),
                Text(
                  job.salary,
                  style: new TextStyle(
                      color: new Color(0xFF54cbc4), fontSize: 14.0),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(job.company),
            ),
            new Container(
              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2.0),
              child: Text(
                job.info,
                style: new TextStyle(color: new Color(0xFF9fa3b0)),
              ),
              decoration: new BoxDecoration(
                color: new Color(0xFFF6F6F8),
                borderRadius: new BorderRadius.all(new Radius.circular(4.0)),
              ),
            ),
            Row(
              children: <Widget>[
                new CircleAvatar(
                  backgroundImage: NetworkImage(job.head),
                  radius: 10,
                ),
                Padding(padding: const EdgeInsets.only(left: 10.0)),
                new Text(job.publish)
              ],
            )
          ],
        ),
      ),
    );
  }
}
