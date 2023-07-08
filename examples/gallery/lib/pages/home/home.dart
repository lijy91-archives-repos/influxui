import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:rise_ui_demos/rise_ui_demos.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return md.Scaffold(
      body: ListView.separated(
        itemBuilder: (_, index) {
          final demoKey = kKnownDemos.keys.toList()[index];
          return GestureDetector(
            child: Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 10,
                bottom: 10,
              ),
              width: double.infinity,
              child: Text(demoKey),
            ),
            onTap: () {
              context.go('/demo/$demoKey');
            },
          );
        },
        separatorBuilder: (_, index) {
          return Divider();
        },
        itemCount: kKnownDemos.length,
      ),
    );
  }
}
