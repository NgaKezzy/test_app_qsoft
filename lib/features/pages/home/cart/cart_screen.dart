import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/component/app_bar/header_app.dart';
import 'package:test_app/core/config/app_logger.dart';
import 'package:test_app/features/cubit/home_cubit.dart';
import 'package:test_app/features/cubit/home_state.dart';
import 'package:test_app/features/models/product.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late HomeCubit homeCubit;
  @override
  void initState() {
    homeCubit = context.read<HomeCubit>();
    homeCubit.totalAmount();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const HeaderApp(
        title: 'Cart',
        color: Colors.orange,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          logger.f(homeCubit.state.totalAmount);
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) => _itemProduct(
                      onAdd: () {
                        homeCubit.increaseQuantity(index);
                      },
                      onRemove: () {
                        homeCubit.reduceQuantity(index);
                      },
                      onDelete: () {
                        homeCubit.removeProductInCarts(index);
                      },
                      context: context,
                      product: state.carts[index]),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: state.carts.length,
                ),
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.all(8),
                width: width,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total price',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          context
                              .watch<HomeCubit>()
                              .state
                              .totalAmount
                              .toString(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width * 0.9,
                      child: MaterialButton(
                          color: Colors.orange,
                          onPressed: () {},
                          child: const Text(
                            'Order',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _itemProduct(
      {required BuildContext context,
      required Product product,
      required VoidCallback onRemove,
      required VoidCallback onAdd,
      required VoidCallback onDelete}) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(8),
      height: height * 0.15,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  product.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name),
                Container(
                  height: 40,
                  width: 130,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey, width: 1, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            onRemove.call();
                          },
                          icon: const Icon(Icons.remove)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          _dialogBuilder(context, product);
                        },
                        child: Text(
                          product.orderQuantity.toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            onAdd.call();
                          },
                          icon: const Icon(Icons.add))
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      onDelete.call();
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.close),
                    ),
                  ),
                  Text(
                    product.price.toString(),
                    style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, Product product) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(product.name)),
          content: TextFormField(
            textAlign: TextAlign.center,
            autofocus: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                      color: Colors.orange, width: 2, style: BorderStyle.solid),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                      color: Colors.orange, width: 2, style: BorderStyle.solid),
                )),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    color: Colors.orange,
                    onPressed: () {},
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
              ],
            ),
          ],
        );
      },
    );
  }
}
