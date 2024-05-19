// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_page_states.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$childCollectionsHash() => r'bbbf5d3ae9cf5c08d11302d5e2c0a4f636cf1648';

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

/// See also [childCollections].
@ProviderFor(childCollections)
const childCollectionsProvider = ChildCollectionsFamily();

/// See also [childCollections].
class ChildCollectionsFamily
    extends Family<AsyncValue<List<CollectionEntity>>> {
  /// See also [childCollections].
  const ChildCollectionsFamily();

  /// See also [childCollections].
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

/// See also [childCollections].
class ChildCollectionsProvider
    extends AutoDisposeFutureProvider<List<CollectionEntity>> {
  /// See also [childCollections].
  ChildCollectionsProvider(
    String parentCollectionId,
  ) : this._internal(
          (ref) => childCollections(
            ref as ChildCollectionsRef,
            parentCollectionId,
          ),
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
  Override overrideWith(
    FutureOr<List<CollectionEntity>> Function(ChildCollectionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChildCollectionsProvider._internal(
        (ref) => create(ref as ChildCollectionsRef),
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
  AutoDisposeFutureProviderElement<List<CollectionEntity>> createElement() {
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
    on AutoDisposeFutureProviderRef<List<CollectionEntity>> {
  /// The parameter `parentCollectionId` of this provider.
  String get parentCollectionId;
}

class _ChildCollectionsProviderElement
    extends AutoDisposeFutureProviderElement<List<CollectionEntity>>
    with ChildCollectionsRef {
  _ChildCollectionsProviderElement(super.provider);

  @override
  String get parentCollectionId =>
      (origin as ChildCollectionsProvider).parentCollectionId;
}

String _$childFilesHash() => r'b46deab9ed07b788df1c29c40a51d3e32213ec0d';

/// See also [childFiles].
@ProviderFor(childFiles)
const childFilesProvider = ChildFilesFamily();

/// See also [childFiles].
class ChildFilesFamily extends Family<AsyncValue<List<FileEntity>>> {
  /// See also [childFiles].
  const ChildFilesFamily();

  /// See also [childFiles].
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

/// See also [childFiles].
class ChildFilesProvider extends AutoDisposeFutureProvider<List<FileEntity>> {
  /// See also [childFiles].
  ChildFilesProvider(
    String parentCollectionId,
  ) : this._internal(
          (ref) => childFiles(
            ref as ChildFilesRef,
            parentCollectionId,
          ),
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
  Override overrideWith(
    FutureOr<List<FileEntity>> Function(ChildFilesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChildFilesProvider._internal(
        (ref) => create(ref as ChildFilesRef),
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
  AutoDisposeFutureProviderElement<List<FileEntity>> createElement() {
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

mixin ChildFilesRef on AutoDisposeFutureProviderRef<List<FileEntity>> {
  /// The parameter `parentCollectionId` of this provider.
  String get parentCollectionId;
}

class _ChildFilesProviderElement
    extends AutoDisposeFutureProviderElement<List<FileEntity>>
    with ChildFilesRef {
  _ChildFilesProviderElement(super.provider);

  @override
  String get parentCollectionId =>
      (origin as ChildFilesProvider).parentCollectionId;
}

String _$currentCollectionHash() => r'bd3e0eeb9a49c3a5f2989acffda23ae60c2ceb60';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
