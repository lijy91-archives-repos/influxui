import 'package:gallery/pages/pages.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/demo/:slug',
      builder: (context, state) => DemoPage(
        slug: state.params['slug']!,
      ),
    ),
  ],
);
