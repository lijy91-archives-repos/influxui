import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart' as p;
import 'package:source_gen/source_gen.dart';
import 'package:storybook_flutter_web_annotation/storybook_flutter_web_annotation.dart';

class StoryCaseVisitor extends SimpleElementVisitor {
  @override
  void visitConstructorElement(ConstructorElement element) {
    print(element.typeParameters.map((e) => e.name));
    element.parameters.forEach((element) {
      print('>>>>>${element.name}');
    });
    // print('>>>>>${element.children.map((e) => e.name)}xxx');
  }
}

class StorybookFlutterWebBuilder implements Builder {
  StorybookFlutterWebBuilder(this.options);

  final BuilderOptions options;

  static AssetId _output(BuildStep buildStep) {
    return AssetId(
      buildStep.inputId.package,
      p.join('lib', 'stories.dart'),
    );
  }

  @override
  Map<String, List<String>> get buildExtensions {
    return const {
      r'$lib$': ['stories.dart']
    };
  }

  String _generateImport(BuildStep buildStep, Map<String, String> result) {
    final String package = buildStep.inputId.package;
    final String path = result['path']!.replaceFirst('lib/', '');
    return "import 'package:$package/$path';";
  }

  String _generateStory(BuildStep buildStep, Map<String, String> result) {
    final String name = result['name']!;
    return name;
  }

  @override
  Future<void> build(BuildStep buildStep) async {
    final List<Map<String, String>> results = [];

    await for (final input in buildStep.findAssets(Glob('lib/stories/**'))) {
      final library = LibraryReader(await buildStep.resolver.libraryFor(input));

      for (var annotatedElement
          in library.annotatedWith(TypeChecker.fromRuntime(UseCase))) {
        final Element element = annotatedElement.element;
        if ((element.name ?? '').isNotEmpty) {
          print('>>>>>');
          element.visitChildren(StoryCaseVisitor());
          print('<<<<<<object>>>>>>');
          results.add({
            'name': element.name!,
            'path': input.path,
          });
        }
      }
    }

    await buildStep.writeAsString(_output(buildStep), '''
${results.map((e) => _generateImport(buildStep, e)).join('\n')}
import 'package:storybook_flutter_web/storybook_flutter_web.dart';

final kStories = <Story>[
  ${results.map((e) => _generateStory(buildStep, e)).join(', \n')}
];
''');
  }
}

Builder storybookFlutterWebBuilder(BuilderOptions options) {
  return StorybookFlutterWebBuilder(options);
}
