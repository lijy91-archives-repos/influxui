import 'package:base_ui_core/base_ui_core.dart';
import 'package:base_ui_test/base_ui_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('golden test', (tester) async {
    await tester.binding.setSurfaceSize(const Size(200, 200));
    await loadTestFonts();

    await tester.pumpWidget(const TestWidgetApp(
      child: Alert(
        title: 'Bummer!',
        message:
            'Something terrible happened! You made a mistake and there is no going back, your data was lost forever!',
      ),
    ));

    await expectLater(
      find.byType(Alert),
      matchesGoldenFile('goldens/alert.png'),
    );
  });
}
