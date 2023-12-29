import 'package:flutter/widgets.dart';
import 'package:gallery/layouts/layouts.dart';
import 'package:gallery/pages/pages.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: BootstrapPage(),
        );
      },
    ),
    ShellRoute(
      pageBuilder: (context, state, child) {
        return FadeTransitionPage(
          key: state.pageKey,
          child: RootLayout(child: child),
        );
      },
      routes: [
        GoRoute(
          path: '/demo/:demoId',
          builder: (context, state) => Builder(
            builder: (ctx) {
              return DemoPage(
                demoId: state.pathParameters['demoId']!,
              );
            },
          ),
        ),
      ],
    ),
  ],
);

/// A page that fades in an out.
class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation.drive(_curveTween),
            child: child,
          ),
          transitionDuration: Duration(milliseconds: 100),
          reverseTransitionDuration: Duration(milliseconds: 100),
        );

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
}
