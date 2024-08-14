import 'package:blog/model/user.dart';
import 'package:blog/view/main_view.dart';
import 'package:blog/view/profile_view.dart/profile_view.dart';
import 'package:blog/view/repository_view/repository_detail_view.dart';
import 'package:blog/view/repository_view/repository_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DevRoute {
  static final rootKey = GlobalKey<NavigatorState>();
  static final profileKey = GlobalKey<NavigatorState>();
  static final repositoryKey = GlobalKey<NavigatorState>();

  static final rootRoute = GoRouter(
    initialLocation: MainView.routeName,
    navigatorKey: DevRoute.rootKey,
    routes: [
      GoRoute(
        path: MainView.routeName,
        builder: (_, __) {
          return const MainView();
        },
      ),
    ],
  );

  static final profileRoute = GoRouter(
    navigatorKey: DevRoute.profileKey,
    initialLocation: ProfileView.routeName,
    routes: [
      GoRoute(
        path: ProfileView.routeName,
        builder: (_, __) {
          return const ProfileView(
            user: User(
              name: "Hann (한)",
              imageURL: "https://avatars.githubusercontent.com/u/54878755?v=4",
              bio: "Flutter & Dart Developer",
              email: 'developer.hann@gmail.com',
            ),
          );
        },
      ),
    ],
  );

  static final repositoryRoute = GoRouter(
    navigatorKey: DevRoute.repositoryKey,
    initialLocation: RepositoryView.routeName,
    routes: [
      GoRoute(
        path: RepositoryView.routeName,
        builder: (_, __) {
          return const RepositoryView();
        },
      ),
      GoRoute(
        path: RepositoryDetailView.routeName,
        builder: (_, __) {
          return const RepositoryDetailView();
        },
      ),
    ],
  );
}
