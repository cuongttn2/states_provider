import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states_provider/drawer_menu.dart';
import 'package:states_provider/model/ui.dart';

import 'model/screen_argument.dart';

class Settings extends StatelessWidget {
  static const String route = '/settings';
  Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Settings'),
      ),
      drawer: DrawerMenu(),
      body: Consumer<UI>(builder: (context, ui, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Font Size: ${ui.fontSize.toInt()}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Slider(
                min: 0.5,
                value: ui.sliderFontSize,
                onChanged: (newValue) {
                  ui.fontSize = newValue;
                }),
            RichText(
              text: TextSpan(
                text:
                    "Argument\ntitle: ${args.title} message: ${args.message}",
                style: TextStyle(fontSize: ui.fontSize, color: Colors.black),
              ),
            )
          ],
        );
      }),
    );
  }
}
