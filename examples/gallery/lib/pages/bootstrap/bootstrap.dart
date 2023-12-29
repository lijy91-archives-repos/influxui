import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:rise_ui_demos/rise_ui_demos.dart';

class BootstrapPage extends StatefulWidget {
  const BootstrapPage({Key? key}) : super(key: key);

  @override
  State<BootstrapPage> createState() => _BootstrapPageState();
}

class _BootstrapPageState extends State<BootstrapPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      String firstDemoId = kKnownDemos.keys.first;
      context.go('/demo/$firstDemoId');
    });
  }

  @override
  Widget build(BuildContext context) {
    return md.Scaffold(
      body: Center(
        child: Loader(),
      ),
    );
  }
}
