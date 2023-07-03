import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart';
import 'package:rise_ui_demos/rise_ui_demos.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({
    Key? key,
    required this.slug,
  }) : super(key: key);

  final String slug;

  @override
  Widget build(BuildContext context) {
    return md.Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            final demo = kKnownDemos[slug];
            if (demo == null) {
              return Text('Demo not found: $slug');
            }
            return demo;
          },
        ),
      ),
    );
  }
}
