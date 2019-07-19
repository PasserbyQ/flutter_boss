
import 'package:flutter/widgets.dart';


abstract class BlocBase {
  void dispose();
}


class BlocProvider<T extends BlocBase> extends StatefulWidget {

  final T bloc;
  final Widget child;

  const BlocProvider({Key key, this.bloc, this.child}) : super(key: key);

  @override
  _BlocProviderState createState() {
    // TODO: implement createState
    return _BlocProviderState();
  }

  static T of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;

}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>>  {

  @override
  void dispose() {
    // TODO: implement dispose
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.child;
  }
}