import 'package:go_router/go_router.dart';
import 'package:influxui/influxui.dart';
import 'package:influxui_demos/influxui_demos.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (_, index) {
          final demoKey = kKnownDemos.keys.toList()[index];
          return GestureDetector(
            child: Container(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 10,
                bottom: 10,
              ),
              width: double.infinity,
              child: Text(demoKey),
            ),
            onTap: () {
              context.go('/demo/$demoKey');
            },
          );
        },
        separatorBuilder: (_, index) {
          return const Divider();
        },
        itemCount: kKnownDemos.length,
      ),
    );
  }
}
