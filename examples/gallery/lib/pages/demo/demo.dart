import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:rise_ui_demos/rise_ui_demos.dart';
import 'package:tabler_icon_library/tabler_icon_library.dart';

class DemoPage extends md.StatefulWidget {
  const DemoPage({
    Key? key,
    required this.slug,
  }) : super(key: key);

  final String slug;

  @override
  md.State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends md.State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return md.Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            final demoBuilder = kKnownDemos[widget.slug];
            if (demoBuilder == null) {
              return Text('Demo not found: ${widget.slug}');
            }
            return demoBuilder.call(context);
          },
        ),
      ),
    );
  }
}
