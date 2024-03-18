import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart';
import 'package:influxui_demos/influxui_demos.dart';

class DemoPage extends md.StatefulWidget {
  const DemoPage({
    super.key,
    required this.demoId,
  });

  final String demoId;

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return md.Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            final demoBuilder = kKnownDemos[widget.demoId];
            if (demoBuilder == null) {
              return Text('Demo not found: ${widget.demoId}');
            }
            return demoBuilder.call(context);
          },
        ),
      ),
    );
  }
}
