import 'package:flutter/cupertino.dart';
import 'package:rise_ui/src/list_tile/list_tile_chevron.dart';

class ListTile extends StatelessWidget {
  const ListTile({
    Key? key,
    this.padding,
    this.icon,
    this.title,
    this.summary,
    this.detailText,
    this.accessoryView,
    this.bottomView,
    this.disabled = false,
    this.onTap,
  }) : super(key: key);

  final EdgeInsets? padding;
  final Widget? icon;
  final Widget? title;
  final Widget? summary;
  final Widget? detailText;
  final Widget? accessoryView;
  final Widget? bottomView;
  final bool? disabled;
  final VoidCallback? onTap;

  Widget _buildDetailText(BuildContext context) {
    if (detailText != null) {
      return DefaultTextStyle(
        style: TextStyle(
          color: Color(0xff999999),
          fontSize: 13,
        ),
        child: detailText!,
      );
    } else {
      return Container();
    }
  }

  Widget _buildAccessoryView(BuildContext context) {
    if (accessoryView != null) {
      return accessoryView!;
    } else {
      return Padding(
        padding: EdgeInsets.only(left: 4),
        child: ListTileChevron(),
      );
    }
  }

  Widget _buildBottomView(BuildContext context) {
    return bottomView ?? Container();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: disabled! ? null : () => onTap?.call(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: 48,
            ),
            padding: padding ?? EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Row(
              children: [
                if (icon != null)
                  Container(
                    child: icon,
                    margin: EdgeInsets.only(right: 10),
                  ),
                if (title != null || summary != null)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (title != null)
                          DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            child: title!,
                          ),
                        if (summary != null)
                          DefaultTextStyle(
                            style: TextStyle(
                              color: Color(0xff999999),
                              fontSize: 12,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 4, bottom: 4),
                              child: summary,
                            ),
                          ),
                      ],
                    ),
                  ),
                _buildDetailText(context),
                _buildAccessoryView(context),
              ],
            ),
          ),
          _buildBottomView(context),
        ],
      ),
    );
  }
}
