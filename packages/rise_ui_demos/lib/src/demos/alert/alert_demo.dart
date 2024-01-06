import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';

class AlertDemo extends StatelessWidget {
  const AlertDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 300,
      color: Colors.transparent,
      child: const Alert(
        title: 'Bummer!',
        message: 'Something terrible happened! '
            'You made a mistake and there is no going back, '
            'your data was lost forever!',
      ),
    );
  }
}
