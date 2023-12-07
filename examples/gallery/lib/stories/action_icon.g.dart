part of 'action_icon.dart';

mixin _$ActionIconMeta on Meta {
  @override
  String get title => 'Widgets/ActionIcon';

  @override
  List<ArgType> get argTypes {
    return [
      ArgType('a'),
      ArgType('a'),
    ];
  }
}

mixin _$ActionIconDefaultStory on StoryObj<ActionIconMeta> {
  @override
  String get name => 'Default';

  @override
  ActionIconMeta get meta => ActionIconMeta();

  @override
  Widget build(BuildContext context, List<Arg> args) {
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
