import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/config/constants.dart';
import 'package:weather_app/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.white,
        title: 'Weather App',
        navigatorKey: AppNavigator.navigatorKey,
        onGenerateRoute: AppNavigator.onGenerateRoute,
        builder: (context, child) {
          final data = MediaQuery.of(context);
          final smallestSize = min(data.size.width, data.size.height);
          final textScaleFactor =
              min(smallestSize / AppConstants.designScreenSize.width, 1.0);

          return MediaQuery(
            data: data.copyWith(
              textScaleFactor: textScaleFactor,
            ),
            child: child,
          );
        });
  }
}
