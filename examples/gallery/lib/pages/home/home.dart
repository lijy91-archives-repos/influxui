import 'package:base_ui/base_ui.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        const Text('HomePage'),
        GestureDetector(
          child: const Text('go /settings'),
          onTap: () {
            context.go('/settings');
          },
        ),
      ]),
    );
  }
}
