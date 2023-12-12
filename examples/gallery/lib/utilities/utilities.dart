import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:gallery/utilities/env.dart';
import 'package:gallery/utilities/platform_util.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

// 请按文件名排序放置
export './env.dart';

final sharedEnv = Env.instance;

Directory? _dataDirectory;

Future<Directory> getAppDirectory() async {
  if (!kIsWeb && _dataDirectory == null) {
    final docDir = await getApplicationDocumentsDirectory();

    if (kIsLinux || kIsWindows) {
      _dataDirectory = Directory(path.join(docDir.parent.path, '.gallery'));
      if (!_dataDirectory!.existsSync()) {
        _dataDirectory!.createSync(recursive: true);
      }
    } else {
      _dataDirectory = docDir;
    }
  }
  return _dataDirectory!;
}
