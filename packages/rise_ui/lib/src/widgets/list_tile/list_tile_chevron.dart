import 'package:flutter/widgets.dart';
import 'package:rise_ui/src/widgets/theme/theme.dart';

class ListTileChevron extends StatelessWidget {
  const ListTileChevron({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.chevron_right,
      size: 21.0,
    );
  }
}
