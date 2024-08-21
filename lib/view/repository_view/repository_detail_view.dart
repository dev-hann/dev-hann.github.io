import 'package:blog/provider/repository_detail_provider.dart';
import 'package:blog/provider/repository_provider.dart';
import 'package:blog/widget/body_layout.dart';
import 'package:blog/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown/markdown.dart' as md;

class RepositoryDetailView extends ConsumerWidget {
  const RepositoryDetailView({
    super.key,
    required this.title,
  });
  final String title;
  static const routeName = "detail";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(repositoryProvider.notifier);
    final post = provider.loadPost(title);
    if (post == null) {
      return const Text("post is Empty");
    }
    final detailProvider = ref.watch(repositoryDetailProvider(post));
    return DevBodyLayout(
      child: detailProvider.when(
        data: (data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MarkdownBody(
                data: data.content,
                extensionSet: md.ExtensionSet.gitHubWeb,
                styleSheet: MarkdownStyleSheet(
                  h1: Theme.of(context).textTheme.headlineLarge,
                  h2: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () {
          return const LoadingWidget();
        },
      ),
    );
  }
}
