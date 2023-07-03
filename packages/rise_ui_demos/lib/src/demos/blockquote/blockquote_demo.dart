import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class BlockquoteDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Blockquote(
        cite: '– Forrest Gump',
        child: Text(
          'Life is like an npm install '
          '– you never know what you are going to get.',
        ),
      ),
    );
  }
}
