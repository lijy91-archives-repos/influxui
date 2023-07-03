import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:rise_ui_demos/rise_ui_demos.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return md.Scaffold(
      body: Container(
        child: Column(
          children: [
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
