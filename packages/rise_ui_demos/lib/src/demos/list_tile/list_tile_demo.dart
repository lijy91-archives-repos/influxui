import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class ListTileDemo extends StatelessWidget {
  const ListTileDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text('List Tile Demo'),
      ),
    );
  }
}
