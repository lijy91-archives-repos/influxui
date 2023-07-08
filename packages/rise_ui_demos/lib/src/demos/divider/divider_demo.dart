import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class DividerDemo extends StatelessWidget {
  const DividerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            variant: DividerVariant.solid,
          ),
          SizedBox(height: 20),
          Divider(
            variant: DividerVariant.dashed,
          ),
          SizedBox(height: 20),
          Divider(
            variant: DividerVariant.dotted,
          ),
        ],
      ),
    );
  }
}
