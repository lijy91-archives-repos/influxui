import 'package:influxui/influxui.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Button(
          label: 'Settings',
          onPressed: () {},
        ),
      ],
    );
  }
}
