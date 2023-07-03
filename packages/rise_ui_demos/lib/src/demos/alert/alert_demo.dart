import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class AlertDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Alert(
        title: 'Bummer!',
        message: 'Something terrible happened! '
            'You made a mistake and there is no going back, '
            'your data was lost forever!',
      ),
    );
  }
}
