import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_provider/about.dart';
import 'package:states_provider/home.dart';
import 'package:states_provider/model/ui.dart';
import 'package:states_provider/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String initialRoute = '/';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UI()),
      ],
      child: MaterialApp(
        initialRoute: initialRoute,
        routes: {
          initialRoute: (context) => Home(),
          About.route: (context) => About(),
          Settings.route: (context) => Settings(),
        },
      ),
    );
  }
}
