// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:test_app/features/models/product.dart';
part 'home_state.g.dart';
@CopyWith()
class HomeState extends Equatable {
  const HomeState({
    this.carts = const [],
    this.cartValueTextEditingController,
    this.isShowError = false,
  });

  final List<Product> carts;
  final TextEditingController? cartValueTextEditingController;
  final bool isShowError;

  @override
  List<Object?> get props =>
      [carts, cartValueTextEditingController, isShowError];
}
