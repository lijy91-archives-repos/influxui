import 'package:flutter/material.dart';
import 'package:influxui/influxui.dart';

class AlertDemo extends StatelessWidget {
  const AlertDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      color: Colors.transparent,
      child: GappedColumn(
        gap: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final type in AlertType.values)
            Alert(
              type: type,
              icon: const Icon(Icons.info),
              title: 'Alert type: $type',
              message: 'This is an alert of type $type. '
                  'It is used to attract user attention with important static message.',
            ),
        ],
      ),
    );
  }
}
