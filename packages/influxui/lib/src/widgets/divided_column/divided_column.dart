import 'package:flutter/widgets.dart';

class DividedColumn extends Flex {
  DividedColumn({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    required Widget divider,
    List<Widget> children = const <Widget>[],
  }) : super(
          direction: Axis.vertical,
          children: children.expand((widget) => [widget, divider]).toList()
            ..removeLast(),
        );
}
