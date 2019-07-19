import 'package:demo_flutter_boss/blocs/bloc_increment.dart';
import 'package:demo_flutter_boss/blocs/bloc_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CompanyDetailPageState();
  }
}

class _CompanyDetailPageState extends State<CompanyDetailPage> {

  IncrementBloc bloc;
  @override
  Widget build(BuildContext context) {
    
    bloc = BlocProvider.of<IncrementBloc>(context);

    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Bloc',style: new TextStyle(fontSize: 20.0, color: Colors.white)),
      ),
      body: BlocProvider<IncrementBloc>(
        bloc: IncrementBloc(),
        child: Column(
          children: <Widget>[
            _createContent(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: CupertinoButton(
                  onPressed: () {
                    bloc.incrementCounter();
                  },
                  child: Text('点我啊'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //创建内容
  Widget _createContent() {
    
    return StreamBuilder<int>(
      stream: bloc.stream,
      initialData: 0,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return Text('点击了: ${snapshot.data} 次');
      },
    );
  }
}
