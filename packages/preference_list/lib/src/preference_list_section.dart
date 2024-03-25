import 'package:influxui/influxui.dart';

class PreferenceListSection extends StatelessWidget {
  const PreferenceListSection({
    Key? key,
    this.leading,
    this.header,
    this.footer,
    this.children = const <Widget>[],
  }) : super(key: key);

  final Widget? leading;
  final Widget? header;
  final Widget? footer;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (header != null)
              Container(
                padding: const EdgeInsets.only(
                  top: 0,
                  bottom: 10,
                  left: 12,
                  right: 12,
                ),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    color: Color(0xff9b9b9b),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                  child: header!,
                ),
              ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: Row(
                  children: [
                    if (leading != null) leading!,
                    Expanded(
                      child: DividedColumn(
                        divider: const Padding(
                          padding: EdgeInsets.only(
                            left: 12,
                            right: 12,
                          ),
                          child: Divider(),
                        ),
                        children: children,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (footer != null)
              Container(
                padding: const EdgeInsets.only(
                  top: 6,
                  bottom: 6,
                  left: 12,
                  right: 12,
                ),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    color: Color(0xff9b9b9b),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                  child: footer!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
