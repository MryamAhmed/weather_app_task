import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'injection_container.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  Bloc.observer = sl<SimpleBlocObserver>();
  runApp(const WeatherApp());
}
