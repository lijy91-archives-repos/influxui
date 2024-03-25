# preference_list

[![pub version][pub-image]][pub-url]

[pub-image]: https://img.shields.io/pub/v/preference_list.svg
[pub-url]: https://pub.dev/packages/preference_list

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [preference_list](#preference_list)
  - [Quick Start](#quick-start)
    - [Installation](#installation)
    - [Usage](#usage)
  - [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Quick Start

### Installation

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  preference_list:
    git:
      url: https://github.com/leanflutter/preference_list
      ref: main
```

### Usage

```dart
import 'package:preference_list/preference_list.dart';

Widget _build(BuildContext context) {
  return PreferenceList(
    children: <Widget>[
      PreferenceListSection(
        header: Text('APPEARANCE'),
        children: [
          SwitchPreferenceListTile(
            title: Text('Dark Appearance'),
            value: _isDarkAppearance,
            onChanged: (newValue) {
              setState(() {
                _isDarkAppearance = !_isDarkAppearance;
              });
            },
          )
        ],
      ),
      PreferenceListSection(
        header: Text('DISPLAY ZOOM'),
        footer: Text(
            'Choose a view for iphone Zoomed shows larger controls. Standard shows more content'),
        children: [
          PreferenceListTile(
            title: Text('View'),
            additionalInfo: Text('Standard'),
            onTap: () {
              BotToast.showText(text: 'Tapped!');
            },
          )
        ],
      ),
      PreferenceListSection(
        header: Text('PAIRED DEVICES'),
        footer: Text(
            'Removing trusted computers will delete all of the records of computers that you have paired with previously'),
        children: [
          PreferenceListTile(
            title: Text(
              'Clear Trusted Computers',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            accessoryView: Container(),
            onTap: () {
              BotToast.showText(text: 'Tapped!');
            },
          )
        ],
      ),
    ],
  );
}
```

## License

[MIT](./LICENSE)
