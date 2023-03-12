import 'package:flutter/material.dart';

/// Display keyboard button or keys combination
class Kbd extends StatelessWidget {
  final String keyLabel;

  const Kbd(this.keyLabel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(keyLabel);
  }
}
