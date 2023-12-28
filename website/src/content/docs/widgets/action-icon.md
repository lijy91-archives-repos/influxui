---
title: ActionIcon
---

## Usage

```dart
import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';

class ActionIconDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ActionIcon(
      Icons.light_mode,
      variant: ActionIconVariant.light,
      onPressed: () {
        // Do something
      },
    );
  }
}
```