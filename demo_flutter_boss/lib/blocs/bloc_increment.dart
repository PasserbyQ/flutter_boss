import 'dart:async';

import 'package:demo_flutter_boss/blocs/bloc_provider.dart';

class IncrementBloc extends BlocBase {
  StreamController<int> _countController = StreamController<int>();
  Stream<int> get stream => _countController.stream;

  int _counter = 0;

  IncrementBloc(){
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _countController.close();
  }

  incrementCounter() {
    _counter = _counter+1;
    _countController.sink.add(_counter);
  }


}
