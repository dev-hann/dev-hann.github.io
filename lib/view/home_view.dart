import 'package:blog/icon/icon.dart';
import 'package:blog/provider/home_provider.dart';
import 'package:blog/view/profile_view.dart/profile_view.dart';
import 'package:blog/view/repository_view/repository_view.dart';
import 'package:blog/widget/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({
    super.key,
    required this.child,
  });
  final Widget child;
  static const routeName = "/";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(
      initialLength: 2,
    );

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            GoRouter.of(context).goNamed(ProfileView.routeName);
          },
          child: const Text("dev-hann's Blog"),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DevTabBar(
            controller: tabController,
            onTap: (index) {
              ref
                  .read(homeProvider.notifier)
                  .updateDevTabType(DevTabType.values[index]);
              switch (index) {
                case 0:
                  GoRouter.of(context).goNamed(ProfileView.routeName);
                  break;

                case 1:
                  GoRouter.of(context).goNamed(RepositoryView.routeName);
                  break;
              }
            },
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
            child: child,
          ),
        ],
      ),
    );
  }
}
