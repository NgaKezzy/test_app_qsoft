// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomeStateCWProxy {
  HomeState totalAmount(double totalAmount);

  HomeState status(HomeStatus status);

  HomeState order(int order);

  HomeState carts(List<Product> carts);

  HomeState cartValueTextEditingController(
      TextEditingController? cartValueTextEditingController);

  HomeState isShowError(bool isShowError);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeState call({
    double? totalAmount,
    HomeStatus? status,
    int? order,
    List<Product>? carts,
    TextEditingController? cartValueTextEditingController,
    bool? isShowError,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHomeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHomeState.copyWith.fieldName(...)`
class _$HomeStateCWProxyImpl implements _$HomeStateCWProxy {
  const _$HomeStateCWProxyImpl(this._value);

  final HomeState _value;

  @override
  HomeState totalAmount(double totalAmount) => this(totalAmount: totalAmount);

  @override
  HomeState status(HomeStatus status) => this(status: status);

  @override
  HomeState order(int order) => this(order: order);

  @override
  HomeState carts(List<Product> carts) => this(carts: carts);

  @override
  HomeState cartValueTextEditingController(
          TextEditingController? cartValueTextEditingController) =>
      this(cartValueTextEditingController: cartValueTextEditingController);

  @override
  HomeState isShowError(bool isShowError) => this(isShowError: isShowError);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeState call({
    Object? totalAmount = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? order = const $CopyWithPlaceholder(),
    Object? carts = const $CopyWithPlaceholder(),
    Object? cartValueTextEditingController = const $CopyWithPlaceholder(),
    Object? isShowError = const $CopyWithPlaceholder(),
  }) {
    return HomeState(
      totalAmount:
          totalAmount == const $CopyWithPlaceholder() || totalAmount == null
              ? _value.totalAmount
              // ignore: cast_nullable_to_non_nullable
              : totalAmount as double,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as HomeStatus,
      order: order == const $CopyWithPlaceholder() || order == null
          ? _value.order
          // ignore: cast_nullable_to_non_nullable
          : order as int,
      carts: carts == const $CopyWithPlaceholder() || carts == null
          ? _value.carts
          // ignore: cast_nullable_to_non_nullable
          : carts as List<Product>,
      cartValueTextEditingController:
          cartValueTextEditingController == const $CopyWithPlaceholder()
              ? _value.cartValueTextEditingController
              // ignore: cast_nullable_to_non_nullable
              : cartValueTextEditingController as TextEditingController?,
      isShowError:
          isShowError == const $CopyWithPlaceholder() || isShowError == null
              ? _value.isShowError
              // ignore: cast_nullable_to_non_nullable
              : isShowError as bool,
    );
  }
}

extension $HomeStateCopyWith on HomeState {
  /// Returns a callable class that can be used as follows: `instanceOfHomeState.copyWith(...)` or like so:`instanceOfHomeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeStateCWProxy get copyWith => _$HomeStateCWProxyImpl(this);
}
