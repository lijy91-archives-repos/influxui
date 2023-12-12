import 'package:collection/collection.dart';
import 'package:flutter/material.dart' as md;
import 'package:flutter/widgets.dart';
import 'package:gallery/.storybook/main.dart';
import 'package:storybook_dart/storybook_dart.dart';

class StoryPreviewPage extends StatefulWidget {
  const StoryPreviewPage({
    Key? key,
    this.args = const {},
  }) : super(key: key);

  final Map<String, dynamic> args;

  @override
  State<StoryPreviewPage> createState() => _StoryPreviewPageState();
}

class _StoryPreviewPageState extends md.State<StoryPreviewPage> {
  String? _id;

  List<StoryObj> get _stories => storybook.stories;

  @override
  void initState() {
    super.initState();
    _id = widget.args['id'] as String?;
  }

  @override
  void didUpdateWidget(covariant StoryPreviewPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.args != widget.args) {
      _id = widget.args['id'] as String?;
      setState(() {});
    }
  }

  Widget _buildStoryList(BuildContext context) {
    return md.Scaffold(
      backgroundColor: md.Colors.transparent,
      body: ListView(
        children: _stories.map((story) {
          return md.ListTile(
            title: Text(story.meta.title),
            subtitle: md.SelectableText(story.id),
            onTap: () {
              setState(() {
                _id = story.id;
              });
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildStoryPreview(BuildContext context) {
    return Center(
      child: Builder(
        builder: (context) {
          final StoryObj? story = _stories.firstWhereOrNull(
            (e) => e.id == _id,
          );
          if (story == null) {
            return Text('Not found');
          }
          return story.build(context, []);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return md.Scaffold(
      backgroundColor: md.Colors.transparent,
      body:
          _id == null ? _buildStoryList(context) : _buildStoryPreview(context),
    );
  }
}
