import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playground/core/authentication_service.dart';
import 'package:playground/pages/friends_page.dart';
import 'package:provider/provider.dart';
import 'package:playground/core/navigation_scaffolding.dart';
import 'package:playground/pages/sign_in_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter playgroundRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/friends",
  routes: <RouteBase>[
    GoRoute(
      path: '/signIn',
      builder: (BuildContext context, GoRouterState state) {
        return const SignInPage();
      },
    ),
    // hack to avoid default 404 page routing home to '/'
    GoRoute(path: '/', redirect: (_, __) => "/friends"),
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget page) {
          return NavigationScaffolding(page: page);
        },
        routes: [
          GoRoute(
            path: '/friends',
            builder: (BuildContext context, GoRouterState state) {
              return const FriendsPage();
            },
            redirect: (context, _) =>
                context.read<AuthenticationService>().currentUser == null
                    ? "/signIn"
                    : null,
          ),
        ]),
  ],
);
