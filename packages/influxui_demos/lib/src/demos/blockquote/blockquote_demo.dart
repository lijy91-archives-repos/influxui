import 'package:flutter/material.dart';
import 'package:influxui/influxui.dart';

class BlockquoteDemo extends StatelessWidget {
  const BlockquoteDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      color: Colors.transparent,
      child: const Blockquote(
        cite: '– Forrest Gump',
        child: Text(
          'Life is like an npm install '
          '– you never know what you are going to get.',
        ),
      ),
    );
  }
}
