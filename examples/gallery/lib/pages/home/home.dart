import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:rise_ui_demos/rise_ui_demos.dart';
import 'package:tabler_icon_library/tabler_icon_library.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return md.Scaffold(
      body: Container(
        child: Column(
          children: [
            Icon(
              TablerIcons.settings,
            ),
            for (final demoKey in kKnownDemos.keys)
              GestureDetector(
                child: Text(demoKey),
                onTap: () {
                  context.go('/demo/$demoKey');
                },
              ),
          ],
        ),
      ),
    );
  }
}
