import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/main_bloc/bloc.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(BlocProvider(child: App()));
}
