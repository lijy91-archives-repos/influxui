import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class ListSectionDemo extends StatelessWidget {
  const ListSectionDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListSection(
        title: Text('List Section Demo'),
      ),
    );
  }
}
