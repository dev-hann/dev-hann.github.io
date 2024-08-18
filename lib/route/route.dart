import 'package:blog/model/user.dart';
import 'package:blog/view/home_view.dart';
import 'package:blog/view/profile_view.dart/profile_view.dart';
import 'package:blog/view/repository_view/repository_detail_view.dart';
import 'package:blog/view/repository_view/repository_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DevRoute {
  static final rootKey = GlobalKey<NavigatorState>();
  static final shellKey = GlobalKey<NavigatorState>();

  static final rootRoute = GoRouter(
    initialLocation: ProfileView.routeName,
    navigatorKey: DevRoute.rootKey,
    routes: [
      ShellRoute(
        navigatorKey: shellKey,
        builder: (context, state, child) {
          return HomeView(
            child: child,
          );
        },
        routes: [
          GoRoute(
            name: ProfileView.routeName,
            path: ProfileView.routeName,
            builder: (_, __) {
              return const ProfileView(
                user: User(
                  name: "Hann (한)",
                  imageURL:
                      "https://avatars.githubusercontent.com/u/54878755?v=4",
                  bio: "Flutter & Dart Developer",
                  email: 'developer.hann@gmail.com',
                ),
              );
            },
          ),
          GoRoute(
            name: RepositoryView.routeName,
            path: RepositoryView.routeName,
            builder: (_, state) {
              return const RepositoryView();
            },
            routes: [
              GoRoute(
                name: RepositoryDetailView.routeName,
                path: "${RepositoryDetailView.routeName}/:title",
                builder: (_, state) {
                  return RepositoryDetailView(
                    title: state.pathParameters["title"] ?? "",
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
