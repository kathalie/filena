// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_page_states.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentCollectionHash() => r'bd3e0eeb9a49c3a5f2989acffda23ae60c2ceb60';

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

/// See also [currentCollection].
@ProviderFor(currentCollection)
const currentCollectionProvider = CurrentCollectionFamily();

/// See also [currentCollection].
class CurrentCollectionFamily extends Family<AsyncValue<CollectionEntity>> {
  /// See also [currentCollection].
  const CurrentCollectionFamily();

  /// See also [currentCollection].
  CurrentCollectionProvider call(
    String collectionId,
  ) {
    return CurrentCollectionProvider(
      collectionId,
    );
  }

  @override
  CurrentCollectionProvider getProviderOverride(
    covariant CurrentCollectionProvider provider,
  ) {
    return call(
      provider.collectionId,
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
  String? get name => r'currentCollectionProvider';
}

/// See also [currentCollection].
class CurrentCollectionProvider
    extends AutoDisposeFutureProvider<CollectionEntity> {
  /// See also [currentCollection].
  CurrentCollectionProvider(
    String collectionId,
  ) : this._internal(
          (ref) => currentCollection(
            ref as CurrentCollectionRef,
            collectionId,
          ),
          from: currentCollectionProvider,
          name: r'currentCollectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentCollectionHash,
          dependencies: CurrentCollectionFamily._dependencies,
          allTransitiveDependencies:
              CurrentCollectionFamily._allTransitiveDependencies,
          collectionId: collectionId,
        );

  CurrentCollectionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collectionId,
  }) : super.internal();

  final String collectionId;

  @override
  Override overrideWith(
    FutureOr<CollectionEntity> Function(CurrentCollectionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CurrentCollectionProvider._internal(
        (ref) => create(ref as CurrentCollectionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collectionId: collectionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CollectionEntity> createElement() {
    return _CurrentCollectionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentCollectionProvider &&
        other.collectionId == collectionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collectionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CurrentCollectionRef on AutoDisposeFutureProviderRef<CollectionEntity> {
  /// The parameter `collectionId` of this provider.
  String get collectionId;
}

class _CurrentCollectionProviderElement
    extends AutoDisposeFutureProviderElement<CollectionEntity>
    with CurrentCollectionRef {
  _CurrentCollectionProviderElement(super.provider);

  @override
  String get collectionId => (origin as CurrentCollectionProvider).collectionId;
}

String _$childCollectionsHash() => r'3ce2d7aeefe20fd15ae5f2114afc169a526bf517';

abstract class _$ChildCollections
    extends BuildlessAutoDisposeAsyncNotifier<List<CollectionEntity>> {
  late final String parentCollectionId;

  FutureOr<List<CollectionEntity>> build(
    String parentCollectionId,
  );
}

/// See also [ChildCollections].
@ProviderFor(ChildCollections)
const childCollectionsProvider = ChildCollectionsFamily();

/// See also [ChildCollections].
class ChildCollectionsFamily
    extends Family<AsyncValue<List<CollectionEntity>>> {
  /// See also [ChildCollections].
  const ChildCollectionsFamily();

  /// See also [ChildCollections].
  ChildCollectionsProvider call(
    String parentCollectionId,
  ) {
    return ChildCollectionsProvider(
      parentCollectionId,
    );
  }

  @override
  ChildCollectionsProvider getProviderOverride(
    covariant ChildCollectionsProvider provider,
  ) {
    return call(
      provider.parentCollectionId,
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
  String? get name => r'childCollectionsProvider';
}

/// See also [ChildCollections].
class ChildCollectionsProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ChildCollections, List<CollectionEntity>> {
  /// See also [ChildCollections].
  ChildCollectionsProvider(
    String parentCollectionId,
  ) : this._internal(
          () => ChildCollections()..parentCollectionId = parentCollectionId,
          from: childCollectionsProvider,
          name: r'childCollectionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$childCollectionsHash,
          dependencies: ChildCollectionsFamily._dependencies,
          allTransitiveDependencies:
              ChildCollectionsFamily._allTransitiveDependencies,
          parentCollectionId: parentCollectionId,
        );

  ChildCollectionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parentCollectionId,
  }) : super.internal();

  final String parentCollectionId;

  @override
  FutureOr<List<CollectionEntity>> runNotifierBuild(
    covariant ChildCollections notifier,
  ) {
    return notifier.build(
      parentCollectionId,
    );
  }

  @override
  Override overrideWith(ChildCollections Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChildCollectionsProvider._internal(
        () => create()..parentCollectionId = parentCollectionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        parentCollectionId: parentCollectionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ChildCollections,
      List<CollectionEntity>> createElement() {
    return _ChildCollectionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChildCollectionsProvider &&
        other.parentCollectionId == parentCollectionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parentCollectionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChildCollectionsRef
    on AutoDisposeAsyncNotifierProviderRef<List<CollectionEntity>> {
  /// The parameter `parentCollectionId` of this provider.
  String get parentCollectionId;
}

class _ChildCollectionsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChildCollections,
        List<CollectionEntity>> with ChildCollectionsRef {
  _ChildCollectionsProviderElement(super.provider);

  @override
  String get parentCollectionId =>
      (origin as ChildCollectionsProvider).parentCollectionId;
}

String _$childFilesHash() => r'dcddc69da812f520f1400ded925b14cd5217273e';

abstract class _$ChildFiles
    extends BuildlessAutoDisposeAsyncNotifier<List<FileEntity>> {
  late final String parentCollectionId;

  FutureOr<List<FileEntity>> build(
    String parentCollectionId,
  );
}

/// See also [ChildFiles].
@ProviderFor(ChildFiles)
const childFilesProvider = ChildFilesFamily();

/// See also [ChildFiles].
class ChildFilesFamily extends Family<AsyncValue<List<FileEntity>>> {
  /// See also [ChildFiles].
  const ChildFilesFamily();

  /// See also [ChildFiles].
  ChildFilesProvider call(
    String parentCollectionId,
  ) {
    return ChildFilesProvider(
      parentCollectionId,
    );
  }

  @override
  ChildFilesProvider getProviderOverride(
    covariant ChildFilesProvider provider,
  ) {
    return call(
      provider.parentCollectionId,
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
  String? get name => r'childFilesProvider';
}

/// See also [ChildFiles].
class ChildFilesProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ChildFiles, List<FileEntity>> {
  /// See also [ChildFiles].
  ChildFilesProvider(
    String parentCollectionId,
  ) : this._internal(
          () => ChildFiles()..parentCollectionId = parentCollectionId,
          from: childFilesProvider,
          name: r'childFilesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$childFilesHash,
          dependencies: ChildFilesFamily._dependencies,
          allTransitiveDependencies:
              ChildFilesFamily._allTransitiveDependencies,
          parentCollectionId: parentCollectionId,
        );

  ChildFilesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parentCollectionId,
  }) : super.internal();

  final String parentCollectionId;

  @override
  FutureOr<List<FileEntity>> runNotifierBuild(
    covariant ChildFiles notifier,
  ) {
    return notifier.build(
      parentCollectionId,
    );
  }

  @override
  Override overrideWith(ChildFiles Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChildFilesProvider._internal(
        () => create()..parentCollectionId = parentCollectionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        parentCollectionId: parentCollectionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ChildFiles, List<FileEntity>>
      createElement() {
    return _ChildFilesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChildFilesProvider &&
        other.parentCollectionId == parentCollectionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parentCollectionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChildFilesRef on AutoDisposeAsyncNotifierProviderRef<List<FileEntity>> {
  /// The parameter `parentCollectionId` of this provider.
  String get parentCollectionId;
}

class _ChildFilesProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChildFiles,
        List<FileEntity>> with ChildFilesRef {
  _ChildFilesProviderElement(super.provider);

  @override
  String get parentCollectionId =>
      (origin as ChildFilesProvider).parentCollectionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
