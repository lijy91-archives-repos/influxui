import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:rise_ui_demos/rise_ui_demos.dart';

class RootLayout extends StatefulWidget {
  const RootLayout({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<RootLayout> createState() => _RootLayoutState();
}

class _RootLayoutState extends State<RootLayout> {
  Widget _buildSidebar(BuildContext context) {
    return Container(
      width: 240,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: md.Colors.black.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: ListView.separated(
        itemBuilder: (_, index) {
          final demoKey = kKnownDemos.keys.toList()[index];
          return GestureDetector(
            child: Container(
              padding: const EdgeInsets.only(
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
          return const Divider();
        },
        itemCount: kKnownDemos.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return md.Scaffold(
      body: AdaptiveLayout(
        primaryNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.large: SlotLayout.from(
              key: const Key('primary-navigation-large'),
              builder: (_) => _buildSidebar(context),
            ),
          },
        ),
        body: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.smallAndUp: SlotLayout.from(
              key: const Key('body-medium-and-up'),
              builder: (_) => widget.child,
            ),
          },
        ),
        internalAnimations: false,
      ),
    );
  }
}
