import 'package:storybook_dart_generator/src/meta_info.dart';

class SharedMetas {
  final List<MetaInfo> _metaList = [];

  void add(MetaInfo meta) {
    _metaList.add(meta);
  }

  void remove(MetaInfo meta) {
    _metaList.remove(meta);
  }

  MetaInfo? getMeta(String className) {
    return _metaList.firstWhere((element) => element.className == className);
  }
}
