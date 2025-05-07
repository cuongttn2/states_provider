import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:provider/provider.dart';
import 'package:states_provider/drawer_menu.dart';
import 'package:states_provider/model/screen_argument.dart';
import 'package:states_provider/model/ui.dart';

const kAppTitle = 'State Management by Provider';
const kStateType = 'Provider';

class Home extends StatelessWidget {
  String text = lorem(paragraphs: 3, words: 50);

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)!.settings.arguments ??
        ScreenArguments("", "")) as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppTitle),
        backgroundColor: Colors.teal,
      ),
      drawer: DrawerMenu(),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Consumer<UI>(
          builder: (context, ui, child) {
            return Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: text,
                    style:
                        TextStyle(fontSize: ui.fontSize, color: Colors.black),
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
