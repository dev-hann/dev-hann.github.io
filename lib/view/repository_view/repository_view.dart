import 'package:blog/provider/repository_provider.dart';
import 'package:blog/view/repository_view/repository_detail_view.dart';
import 'package:blog/widget/body_layout.dart';
import 'package:blog/widget/loading_widget.dart';
import 'package:blog/widget/post_card.dart';
import 'package:easy_debounce/easy_debounce.dart';
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

  Widget searchTextField({
    required String query,
    required Function(String value) onSearch,
  }) {
    final controller = TextEditingController(
      text: query,
    );
    return TextField(
      controller: controller,
      onChanged: (value) {
        EasyDebounce.debounce(
          "repositoryViewQueryTextField",
          const Duration(seconds: 1),
          () {
            final text = controller.text.trim();
            onSearch(text);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(repositoryProvider);

    return Scaffold(
      body: provider.when(
        data: (state) {
          final query = state.query;
          final postList = state.postList.where((post) {
            return post.title.contains(query);
          }).toList();
          return DevBodyLayout(
            header: tagListView(),
            child: Column(
              children: [
                searchTextField(
                  onSearch: (value) {
                    ref.read(repositoryProvider.notifier).searchQuery(value);
                  },
                  query: query,
                ),
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
