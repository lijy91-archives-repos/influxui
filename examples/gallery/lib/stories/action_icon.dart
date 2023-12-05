import 'package:flutter/widgets.dart';
import 'package:rise_ui/rise_ui.dart';
import 'package:storybook_flutter_web/storybook_flutter_web.dart';
import 'package:storybook_flutter_web_annotation/storybook_flutter_web_annotation.dart'
    as storybook;

class ActionIconWidgetMeta extends WidgetMeta {
  @override
  String get title => 'Widgets/ActionIcon';

  @override
  List<ArgType> get argTypes {
    return [
      ArgType(),
      ArgType(),
    ];
  }
}

class ActionIconStory extends Story<ActionIconWidgetMeta> {
  ActionIconStory({required super.name});

  @override
  ActionIconWidgetMeta get meta => ActionIconWidgetMeta();

  @override
  Widget build(BuildContext context, Map<String, dynamic> args) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Center(
        child: ActionIcon(
          Icons.light_mode,
          variant: ActionIconVariant.filled,
          onPressed: () {},
        ),
      ),
    );
  }
}

@storybook.UseCase()
final actionIconDefault = ActionIconStory(
  name: 'Default',
);
