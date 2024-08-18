import 'package:blog/provider/repository_provider.dart';
import 'package:blog/view/repository_view/repository_detail_view.dart';
import 'package:blog/widget/body_layout.dart';
import 'package:blog/widget/loading_widget.dart';
import 'package:blog/widget/post_card.dart';
import 'package:blog/widget/post_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RepositoryView extends ConsumerWidget {
  const RepositoryView({
    super.key,
  });
  static const routeName = "/repository";

  Widget tagListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("TagList"),
        const Divider(),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List.generate(5, (index) {
            return Chip(
              label: Text("$index"),
            );
          }),
        ),
      ],
    );
  }

  Widget searchTextField() {
    return Row(
      children: [
        const Expanded(
          child: TextField(),
        ),
        const SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Search"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(repositoryProvider);
    final postList = provider.value ?? [];

    return Scaffold(
      body: provider.when(
        data: (data) {
          return DevBodyLayout(
            header: tagListView(),
            child: Column(
              children: [
                searchTextField(),
                const SizedBox(height: 16.0),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: postList.length,
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemBuilder: (context, index) {
                    final post = postList[index];
                    return PostCard(
                      onTap: () {
                        GoRouter.of(context).goNamed(
                          RepositoryDetailView.routeName,
                          pathParameters: {
                            "title": post.title,
                          },
                        );
                      },
                      post: post,
                    );
                  },
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return const LoadingWidget();
        },
      ),
    );
  }
}
