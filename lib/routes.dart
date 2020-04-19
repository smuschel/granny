import 'package:flutter/widgets.dart';
import 'package:granny/configuration/configuration-screen.dart';
import 'package:granny/main.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder> {
  '/Config': (BuildContext context) => ConfigurationScreen(),
};