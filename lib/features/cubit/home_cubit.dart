import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/core/config/app_logger.dart';
import 'package:test_app/features/cubit/home_state.dart';
import 'package:test_app/features/models/product.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());
  void initData() {
    emit(state.copyWith(isShowError: false, order: 0));
  }

  void addProductToCart({required Product product}) {
    emit(state.copyWith(status: HomeStatus.start));

    if (state.carts.isEmpty) {
      emit(state.copyWith(carts: [product]));
    } else {
      bool isAddCarts = true;
      for (var element in state.carts) {
        if (product.id == element.id) {
          isAddCarts = false;
          logger.f('Hàng đã có trong giỏ hàng');
          return;
        }
      }
      if (isAddCarts) {
        emit(state.copyWith(carts: [...state.carts, product]));
      }
    }
    emit(state.copyWith(status: HomeStatus.success));

    logger.f(state.carts.length);
  }

  void removeProductInCarts(int index) {
    emit(state.copyWith(status: HomeStatus.start));
    final List<Product> newCarts = state.carts;
    newCarts.removeAt(index);
    emit(state.copyWith(carts: newCarts, status: HomeStatus.success));
  }

  void totalAmount() {
    emit(state.copyWith(status: HomeStatus.start));

    double total = 0;
    for (var element in state.carts) {
      int orderQuantity = element.orderQuantity ?? 1;
      total += element.price * orderQuantity;
    }
    logger.e(total);
    emit(state.copyWith(status: HomeStatus.success, totalAmount: total));
  }

  void increaseQuantity(int index) {
    emit(state.copyWith(status: HomeStatus.start));
    final List<Product> newCarts = state.carts;
    int count = newCarts[index].orderQuantity ?? 1;
    count++;

    newCarts[index].orderQuantity = count;
    logger.e(count);

    emit(state.copyWith(status: HomeStatus.success, carts: newCarts));
    totalAmount();
  }

  void reduceQuantity(int index) {
    emit(state.copyWith(status: HomeStatus.start));
    final List<Product> newCarts = state.carts;
    int count = newCarts[index].orderQuantity ?? 1;
    if (count > 1) {
      count--;

      newCarts[index].orderQuantity = count;
      logger.e(count);

      emit(state.copyWith(status: HomeStatus.success, carts: newCarts));
    }
    totalAmount();
  }
}
