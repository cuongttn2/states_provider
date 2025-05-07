import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:provider/provider.dart';
import 'package:states_provider/drawer_menu.dart';
import 'package:states_provider/model/ui.dart';

import 'model/screen_argument.dart';

class About extends StatelessWidget {
  static const String route = '/about';
  String text = lorem(paragraphs: 3, words: 50);

  About({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.teal,
      ),
      drawer: DrawerMenu(),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Consumer<UI>(
          builder: (context, ui, child) {
            return Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: text,
                    style: TextStyle(
                        fontSize: ui.fontSize, color: Colors.lightBlue),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text:
                        "Argument\ntitle: ${args.title} message: ${args.message}",
                    style:
                        TextStyle(fontSize: ui.fontSize, color: Colors.black),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
