import 'package:blog/model/user.dart';
import 'package:blog/view/profile_view.dart/profile_view.dart';
import 'package:blog/view/repository_view/repository_view.dart';
import 'package:flutter/material.dart';

class DevRoute {
  static GlobalKey<NavigatorState> profileKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> repositoryKey = GlobalKey<NavigatorState>();

  static MaterialPageRoute routePage(String? pageName) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        switch (pageName) {
          case "/profile":
            return const ProfileView(
              user: User(
                name: "Hann (한)",
                imageURL:
                    "https://avatars.githubusercontent.com/u/54878755?v=4",
                bio: "Flutter & Dart Developer",
                email: 'developer.hann@gmail.com',
              ),
            );
          case "/repository":
            return const RepositoryView();
        }
        return Text(pageName ?? "");
      },
    );
  }
}
