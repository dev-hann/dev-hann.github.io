// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$repositoryDetailHash() => r'53b037a21a2b0661390596e6d30f477fab7d7d4f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$RepositoryDetail
    extends BuildlessAutoDisposeAsyncNotifier<PostDetail> {
  late final Post post;

  FutureOr<PostDetail> build(
    Post post,
  );
}

/// See also [RepositoryDetail].
@ProviderFor(RepositoryDetail)
const repositoryDetailProvider = RepositoryDetailFamily();

/// See also [RepositoryDetail].
class RepositoryDetailFamily extends Family<AsyncValue<PostDetail>> {
  /// See also [RepositoryDetail].
  const RepositoryDetailFamily();

  /// See also [RepositoryDetail].
  RepositoryDetailProvider call(
    Post post,
  ) {
    return RepositoryDetailProvider(
      post,
    );
  }

  @override
  RepositoryDetailProvider getProviderOverride(
    covariant RepositoryDetailProvider provider,
  ) {
    return call(
      provider.post,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'repositoryDetailProvider';
}

/// See also [RepositoryDetail].
class RepositoryDetailProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RepositoryDetail, PostDetail> {
  /// See also [RepositoryDetail].
  RepositoryDetailProvider(
    Post post,
  ) : this._internal(
          () => RepositoryDetail()..post = post,
          from: repositoryDetailProvider,
          name: r'repositoryDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$repositoryDetailHash,
          dependencies: RepositoryDetailFamily._dependencies,
          allTransitiveDependencies:
              RepositoryDetailFamily._allTransitiveDependencies,
          post: post,
        );

  RepositoryDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.post,
  }) : super.internal();

  final Post post;

  @override
  FutureOr<PostDetail> runNotifierBuild(
    covariant RepositoryDetail notifier,
  ) {
    return notifier.build(
      post,
    );
  }

  @override
  Override overrideWith(RepositoryDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: RepositoryDetailProvider._internal(
        () => create()..post = post,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        post: post,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RepositoryDetail, PostDetail>
      createElement() {
    return _RepositoryDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RepositoryDetailProvider && other.post == post;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, post.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RepositoryDetailRef on AutoDisposeAsyncNotifierProviderRef<PostDetail> {
  /// The parameter `post` of this provider.
  Post get post;
}

class _RepositoryDetailProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RepositoryDetail,
        PostDetail> with RepositoryDetailRef {
  _RepositoryDetailProviderElement(super.provider);

  @override
  Post get post => (origin as RepositoryDetailProvider).post;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
