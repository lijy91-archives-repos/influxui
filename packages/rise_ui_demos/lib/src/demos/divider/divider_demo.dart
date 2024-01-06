import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class DividerDemo extends StatelessWidget {
  const DividerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
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
