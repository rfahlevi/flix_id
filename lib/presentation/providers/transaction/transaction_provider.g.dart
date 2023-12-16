// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createHash() => r'e9381f0528c14103f396c5a3a94602d3a2fdde83';

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

/// See also [create].
@ProviderFor(create)
const createProvider = CreateFamily();

/// See also [create].
class CreateFamily extends Family<AsyncValue<void>> {
  /// See also [create].
  const CreateFamily();

  /// See also [create].
  CreateProvider call({
    required Transaction transaction,
  }) {
    return CreateProvider(
      transaction: transaction,
    );
  }

  @override
  CreateProvider getProviderOverride(
    covariant CreateProvider provider,
  ) {
    return call(
      transaction: provider.transaction,
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
  String? get name => r'createProvider';
}

/// See also [create].
class CreateProvider extends AutoDisposeFutureProvider<void> {
  /// See also [create].
  CreateProvider({
    required Transaction transaction,
  }) : this._internal(
          (ref) => create(
            ref as CreateRef,
            transaction: transaction,
          ),
          from: createProvider,
          name: r'createProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createHash,
          dependencies: CreateFamily._dependencies,
          allTransitiveDependencies: CreateFamily._allTransitiveDependencies,
          transaction: transaction,
        );

  CreateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.transaction,
  }) : super.internal();

  final Transaction transaction;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateProvider._internal(
        (ref) => create(ref as CreateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        transaction: transaction,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateProvider && other.transaction == transaction;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, transaction.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `transaction` of this provider.
  Transaction get transaction;
}

class _CreateProviderElement extends AutoDisposeFutureProviderElement<void>
    with CreateRef {
  _CreateProviderElement(super.provider);

  @override
  Transaction get transaction => (origin as CreateProvider).transaction;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
