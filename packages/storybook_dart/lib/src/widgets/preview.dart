import 'package:flutter/widgets.dart';

class Preview extends StatelessWidget {
  const Preview({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
