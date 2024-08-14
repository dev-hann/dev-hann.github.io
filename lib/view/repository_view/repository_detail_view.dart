import 'package:blog/model/post.dart';
import 'package:blog/provider/repository_detail_provider.dart';
import 'package:blog/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RepositoryDetailView extends ConsumerWidget {
  const RepositoryDetailView({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(repositoryDetailProvider(post));
    return provider.when(
      data: (data) {
        return Text(data.toString());
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return const LoadingWidget();
      },
    );
  }
}
