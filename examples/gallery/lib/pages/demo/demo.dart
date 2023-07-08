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
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: _brightness,
      ),
      child: md.Scaffold(
        backgroundColor:
            _brightness == Brightness.light ? Colors.white : Colors.black,
        body: Stack(
          children: [
            Center(
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
            Positioned(
              right: 20,
              bottom: 20,
              child: ActionIcon(
                _brightness == Brightness.light
                    ? TablerIcons.sun
                    : TablerIcons.moon,
                variant: ActionIconVariant.filled,
                onPressed: () {
                  _brightness = _brightness == Brightness.light
                      ? Brightness.dark
                      : Brightness.light;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
