---
title: ActionIcon
---

## 用法

```dart
import 'package:flutter/widgets.dart';
import 'package:influxui/influxui.dart';

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