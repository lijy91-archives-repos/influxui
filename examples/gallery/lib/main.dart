import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:flutter/material.dart' as md;
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:gallery/router_config.dart';

void main() {
  usePathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Container(
        color: Colors.white,
        child: md.MaterialApp.router(
          title: 'Flutter Demo',
          theme: md.ThemeData(),
          routerConfig: routerConfig,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Button(
            label: 'Login',
            color: Colors.pink,
          ),
        ],
      ),
    );
  }
}
