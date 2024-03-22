import 'package:influxui/influxui.dart';

class IconButtonDemo extends StatelessWidget {
  const IconButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      ExtendedIcons.light_mode,
      variant: IconButtonVariant.light,
      onPressed: () {},
    );
  }
}
