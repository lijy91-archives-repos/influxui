import 'package:flutter/material.dart' hide Divider;

class PageScaffold extends StatelessWidget {
  const PageScaffold({
    super.key,
    this.title,
    this.subtitle,
    required this.child,
  });

  final String? title;
  final String? subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget? titleWidget;
    if (title != null) {
      titleWidget = Text(
        title!,
        style: Theme.of(context).textTheme.titleLarge,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: titleWidget,
        centerTitle: false,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            child,
          ],
        ),
      ),
    );
  }
}
