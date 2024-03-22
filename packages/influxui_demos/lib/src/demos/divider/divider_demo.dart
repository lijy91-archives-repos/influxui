import 'package:influxui/influxui.dart';

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
