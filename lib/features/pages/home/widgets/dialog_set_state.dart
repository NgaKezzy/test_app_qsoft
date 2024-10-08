import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/config/app_logger.dart';
import 'package:test_app/di/dependency_injection.dart';
import 'package:test_app/features/cubit/home_cubit.dart';
import 'package:test_app/features/models/product.dart';
import 'package:test_app/features/pages/home/widgets/dialog_submit_order.dart';

class DialogSetState extends StatefulWidget {
  const DialogSetState({super.key, required this.product});

  final Product product;

  @override
  State<DialogSetState> createState() => _DialogSetStateState();
}

class _DialogSetStateState extends State<DialogSetState> {
  final TextEditingController orderQuantityController = TextEditingController();
  int count = 1;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
        width: width,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          color: Colors.white,
        ),
        height: height * 0.3,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(widget.product.image),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.product.name),
                      Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (count > 1) {
                                    setState(() {
                                      count--;
                                    });
                                  }
                                },
                                icon: const Icon(Icons.remove)),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                orderQuantityController.text = count.toString();

                                _dialogBuilder(
                                    context: context, product: widget.product);
                              },
                              child: Text(
                                count.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    count++;
                                  });
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
                            Navigator.pop(context);
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
                          widget.product.price.toString(),
                          style: const TextStyle(
                              color: Color(0xFF01182e),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: width * 0.9,
              child: MaterialButton(
                  color: const Color(0xFF01182e),
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      widget.product.orderQuantity = count;
                    });

                    getIt<HomeCubit>()
                        .addProductToCart(product: widget.product);
                  },
                  child: const Text(
                    'Thêm vào giỏ hàng',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ));
  }

  Future<void> _dialogBuilder({
    required BuildContext context,
    required Product product,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Center(child: Text(product.name)),
            content: DialogSubmitOrder(
              product: product,
              textEditingController: orderQuantityController,
            ));
      },
    );
  }
}
