import 'package:blog/icon/icon.dart';
import 'package:blog/model/user.dart';
import 'package:blog/route/route.dart';
import 'package:blog/view/profile_view.dart/profile_view.dart';
import 'package:blog/view/repository_view/repository_view.dart';
import 'package:blog/widget/dev_app.dart';
import 'package:blog/widget/tab_bar.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({
    super.key,
  });

  static const routeName = "/";

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final tabController = TabController(
      length: 2,
      vsync: this,
      // initialIndex: 1,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("dev-hann's Blog"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DevTabBar(
            controller: tabController,
            onTap: (index) {},
            tabList: const [
              DevTab(
                icon: DevIcon(DevIcons.overView),
                text: 'Overview',
              ),
              DevTab(
                icon: DevIcon(DevIcons.bookmark),
                text: 'Repository',
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                DevApp(
                  routerConfig: DevRoute.profileRoute,
                ),
                DevApp(
                  routerConfig: DevRoute.repositoryRoute,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
