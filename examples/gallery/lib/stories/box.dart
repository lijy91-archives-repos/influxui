import 'package:flutter/material.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:storybook_flutter_web/storybook_flutter_web.dart';
import 'package:storybook_flutter_web_annotation/storybook_flutter_web_annotation.dart'
    as storybook;

class BoxWidgetMeta extends WidgetMeta {
  @override
  String get title => 'Widgets/Box';

  @override
  List<ArgType> get argTypes {
    return [
      ArgType(),
      ArgType(),
    ];
  }
}

class BoxStory extends Story<BoxWidgetMeta> {
  BoxStory({required super.name});

  @override
  BoxWidgetMeta get meta => BoxWidgetMeta();

  @override
  Widget build(BuildContext context, Map<String, dynamic> args) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Box(
        variant: BoxVariant.filled,
        builder: (context, foregroundColor) {
          return Container();
        },
      ),
    );
  }
}

@storybook.UseCase()
final boxStoryDefault = BoxStory(
  name: 'Default',
);
