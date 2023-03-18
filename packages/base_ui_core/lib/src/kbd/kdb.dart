import 'package:flutter/material.dart';

/// Display keyboard button or keys combination
class Kbd extends StatelessWidget {
  const Kbd(this.keyLabel, {super.key});

  final String keyLabel;

  @override
  Widget build(BuildContext context) {
    return Text(keyLabel);
  }
}
