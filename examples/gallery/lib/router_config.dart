import 'package:go_router/go_router.dart';
import 'package:gallery/pages/pages.dart';

// GoRouter configuration
final routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);
