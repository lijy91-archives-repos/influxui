import 'package:flutter/widgets.dart';
import 'package:influxui/influxui.dart';

class DividerWithLabelDemo extends StatelessWidget {
  const DividerWithLabelDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 500,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            variant: DividerVariant.solid,
            label: 'Label on th left',
            labelPosition: DividerLabelPosition.left,
          ),
          SizedBox(height: 20),
          Divider(
            variant: DividerVariant.solid,
            label: 'Label on th center',
            labelPosition: DividerLabelPosition.center,
          ),
          SizedBox(height: 20),
          Divider(
            variant: DividerVariant.solid,
            label: 'Label on th right',
            labelPosition: DividerLabelPosition.right,
          ),
          SizedBox(height: 20),
          Divider(
            variant: DividerVariant.dashed,
            label: 'Label on th left',
            labelPosition: DividerLabelPosition.left,
          ),
          SizedBox(height: 20),
          Divider(
            variant: DividerVariant.dashed,
            label: 'Label on th center',
            labelPosition: DividerLabelPosition.center,
          ),
          SizedBox(height: 20),
          Divider(
            variant: DividerVariant.dashed,
            label: 'Label on th right',
            labelPosition: DividerLabelPosition.right,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
