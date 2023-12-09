import 'package:flutter/widgets.dart';
import 'package:storybook_dart/src/arg.dart';
import 'package:storybook_dart/src/arg_type.dart';

abstract class Meta {
  String get title;
  List<ArgType> get argTypes;
  Widget buildWidget(BuildContext context, List<Arg> args);
}
