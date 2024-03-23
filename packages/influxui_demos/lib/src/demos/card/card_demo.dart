import 'package:influxui/influxui.dart';

class CardDemo extends StatelessWidget {
  const CardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Center(
          child: Text('Card'),
        ),
      ),
    );
  }
}
