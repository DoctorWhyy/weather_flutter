import 'package:flutter/cupertino.dart';
import 'package:weather_app/ui/screens/weather/bloc/weather_bloc.dart';
import 'package:weather_app/ui/screens/weather_deatail/bloc/weather_deatail_bloc.dart';

// InheritedWidget objects have the ability to be
// searched for anywhere 'below' them in the widget tree.
class BlocProvider extends InheritedWidget {
  // these blocs are the objects that we want to access throughout the app
  final WeatherBloc weatherBloc;
  final WeatherDetailBloc weatherDetailBloc;

  /// Inherited widgets require a child widget
  /// which they implicitly return in the same way
  /// all widgets return other widgets in their 'Widget.build' method.
  BlocProvider(
      {Key key,
      @required Widget child,
      this.weatherBloc,
      this.weatherDetailBloc})
      : assert(child != null),
        super(key: key, child: child);

  /// this method is used to access an instance of
  /// an inherited widget from lower in the tree.
  /// `BuildContext.dependOnInheritedWidgetOfExactType` is a built in
  /// Flutter method that does the hard work of traversing the tree for you
  static BlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BlocProvider>();
  }

  @override
  bool updateShouldNotify(BlocProvider oldWidget) {
    return false;
  }
}
