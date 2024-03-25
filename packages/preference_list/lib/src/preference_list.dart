import 'package:flutter/material.dart';

export './preference_list_section.dart';
export './preference_list_tile.dart';

class PreferenceList extends StatelessWidget {
  const PreferenceList({
    Key? key,
    this.padding,
    this.children = const <Widget>[],
  }) : super(key: key);

  final EdgeInsets? padding;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding ?? const EdgeInsets.only(top: 12),
      children: children,
    );
  }
}
