import 'package:flutter/material.dart';
import 'package:states_provider/about.dart';
import 'package:states_provider/main.dart';
import 'package:states_provider/model/screen_argument.dart';
import 'package:states_provider/settings.dart';

const kTitle = 'Provider';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Center(
              child: Text(
                kTitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          getListTile('Home', onTap: () {
            Navigator.pushReplacementNamed(context, MyApp.initialRoute,
                arguments: ScreenArguments('Extract Arguments Screen',
                    'This message is extracted in the build method.'));
          }),
          getLine(),
          getListTile('About', onTap: () {
            Navigator.pushReplacementNamed(context, About.route,
                arguments: ScreenArguments('Extract Arguments Screen',
                    'This message is extracted in the build method.'));
          }),
          getLine(),
          getListTile('Settings', onTap: () {
            Navigator.pushReplacementNamed(context, Settings.route,
                arguments: ScreenArguments('Extract Arguments Screen',
                    'This message is extracted in the build method.'));
          }),
        ],
      ),
    );
  }

  Widget getLine() {
    return SizedBox(
      height: 0.5,
      child: Container(
        color: Colors.grey,
      ),
    );
  }

  Widget getListTile(title, {required VoidCallback onTap}) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}
