import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:storybook_flutter_web/storybook_flutter_web.dart';
import 'package:storybook_flutter_web_annotation/storybook_flutter_web_annotation.dart'
    as storybook;

class ButtonWidgetMeta extends WidgetMeta {
  @override
  String get title => 'Widgets/Button';

  @override
  List<ArgType> get argTypes {
    return [
      ArgType(),
      ArgType(),
    ];
  }
}

class ButtonStory extends Story<ButtonWidgetMeta> {
  ButtonStory({required super.name});

  @override
  ButtonWidgetMeta get meta => ButtonWidgetMeta();

  @override
  Widget build(BuildContext context, Map<String, dynamic> args) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Button(
        label: 'button',
        variant: ButtonVariant.filled,
      ),
    );
  }
}

@storybook.UseCase()
final buttonStoryDefault = ButtonStory(
  name: 'Default',
);
