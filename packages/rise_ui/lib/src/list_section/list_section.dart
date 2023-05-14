import 'package:flutter/material.dart';

class ListSection extends StatelessWidget {
  const ListSection({
    Key? key,
    this.leading,
    this.title,
    this.description,
    this.children = const <Widget>[],
  }) : super(key: key);

  final Widget? leading;
  final Widget? title;
  final Widget? description;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          left: 12,
          right: 12,
          top: 12,
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Container(
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: Color(0xff9b9b9b),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                  child: title!,
                ),
                padding: EdgeInsets.only(
                  top: 0,
                  bottom: 10,
                  left: 12,
                  right: 12,
                ),
              ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                  ),
                  child: Row(
                    children: [
                      if (leading != null) leading!,
                      Expanded(
                        child: Column(
                          children: [
                            for (var i = 0; i < children.length; i++)
                              Builder(builder: (_) {
                                Widget child = children[i];
                                return Column(
                                  children: [
                                    child,
                                    if (i < children.length - 1)
                                      Divider(
                                        height: 0,
                                        indent: 12,
                                        endIndent: 12,
                                      ),
                                  ],
                                );
                              })
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            if (description != null)
              Container(
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: Color(0xff9b9b9b),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                  child: description!,
                ),
                padding: EdgeInsets.only(
                  top: 6,
                  bottom: 6,
                  left: 12,
                  right: 12,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
