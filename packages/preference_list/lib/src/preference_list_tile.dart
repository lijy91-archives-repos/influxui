import 'package:influxui/influxui.dart';

class PreferenceListTile extends StatelessWidget {
  const PreferenceListTile({
    Key? key,
    this.padding,
    this.leading,
    this.title,
    this.subtitle,
    this.additionalInfo,
    this.accessoryView,
    this.bottomView,
    this.disabled = false,
    this.onTap,
  }) : super(key: key);

  final EdgeInsets? padding;
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? additionalInfo;
  final Widget? accessoryView;
  final Widget? bottomView;
  final bool? disabled;
  final VoidCallback? onTap;

  _onTap() {
    onTap?.call();
  }

  Widget buildDetailText(BuildContext context) {
    if (additionalInfo != null) {
      return DefaultTextStyle(
        style: const TextStyle(
          color: Color(0xff999999),
          fontSize: 13,
        ),
        child: additionalInfo!,
      );
    } else {
      return Container();
    }
  }

  Widget buildAccessoryView(BuildContext context) {
    if (accessoryView != null) {
      return accessoryView!;
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Icon(
          ExtendedIcons.chevron_right,
          size: 14,
          color: const Color(0xff999999),
        ),
      );
    }
  }

  Widget buildBottomView(BuildContext context) {
    return bottomView ?? Container();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: disabled! ? null : _onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            constraints: const BoxConstraints(
              minHeight: 48,
            ),
            padding: padding ?? const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Row(
              children: [
                if (leading != null)
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: leading,
                  ),
                if (title != null || subtitle != null)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (title != null)
                          DefaultTextStyle(
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                            child: title!,
                          ),
                        if (subtitle != null)
                          DefaultTextStyle(
                            style: Theme.of(context).textTheme.bodySmall!,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4, bottom: 4),
                              child: subtitle,
                            ),
                          ),
                      ],
                    ),
                  ),
                buildDetailText(context),
                buildAccessoryView(context),
              ],
            ),
          ),
          buildBottomView(context),
        ],
      ),
    );
  }
}

class RadioPreferenceListTile<T> extends PreferenceListTile {
  const RadioPreferenceListTile({
    Key? key,
    Widget? leading,
    Widget? title,
    Widget? subtitle,
    Widget? additionalInfo,
    Widget? accessoryView,
    VoidCallback? onTap,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
  }) : super(
          key: key,
          leading: leading,
          title: title,
          subtitle: subtitle,
          additionalInfo: additionalInfo,
          accessoryView: accessoryView,
          onTap: onTap,
        );

  final T? value;
  final T? groupValue;
  final ValueChanged<T>? onChanged;

  @override
  void _onTap() {
    onChanged?.call(value as T);
    super._onTap();
  }

  @override
  Widget buildAccessoryView(BuildContext context) {
    if (value != null && value == groupValue) {
      return Icon(
        ExtendedIcons.square,
        size: 22,
        color: Theme.of(context).primaryColor,
      );
    }
    return Container();
  }
}

class SwitchPreferenceListTile extends PreferenceListTile {
  const SwitchPreferenceListTile({
    Key? key,
    Widget? leading,
    Widget? title,
    Widget? subtitle,
    Widget? additionalInfo,
    Widget? accessoryView,
    VoidCallback? onTap,
    @required this.value,
    @required this.onChanged,
  }) : super(
          key: key,
          leading: leading,
          title: title,
          subtitle: subtitle,
          additionalInfo: additionalInfo,
          accessoryView: accessoryView,
          onTap: onTap,
        );

  final bool? value;
  final ValueChanged<bool>? onChanged;

  @override
  void _onTap() {
    onChanged!(!value!);
    super._onTap();
  }

  @override
  Widget buildAccessoryView(BuildContext context) {
    return SizedBox(
      height: 22,
      width: 34,
      child: Transform.scale(
        scale: 0.8,
        child: Switch(
          value: value!,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class TextFieldPreferenceListTile extends PreferenceListTile {
  const TextFieldPreferenceListTile({
    Key? key,
    Widget? leading,
    Widget? title,
    Widget? subtitle,
    Widget? accessoryView,
    VoidCallback? onTap,
    this.placeholder,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
  }) : super(
          key: key,
          leading: leading,
          title: title,
          subtitle: subtitle,
          accessoryView: accessoryView,
          onTap: onTap,
        );

  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;

  @override
  bool get disabled => true;

  @override
  Widget buildDetailText(BuildContext context) {
    return Expanded(
      child: TextField(
        // padding: EdgeInsets.zero,
        // decoration: const BoxDecoration(),
        // placeholder: placeholder,
        style: const TextStyle(
          fontSize: 14,
        ),
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
