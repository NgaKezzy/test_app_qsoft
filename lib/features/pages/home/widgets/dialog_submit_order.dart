import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/di/dependency_injection.dart';
import 'package:test_app/features/cubit/home_cubit.dart';
import 'package:test_app/features/models/product.dart';

class DialogSubmitOrder extends StatefulWidget {
  const DialogSubmitOrder({
    super.key,
    required this.product,
    required this.textEditingController,
  });
  final Product product;
  final TextEditingController textEditingController;

  @override
  State<DialogSubmitOrder> createState() => _DialogSubmitOrderState();
}

class _DialogSubmitOrderState extends State<DialogSubmitOrder> {
  // final HomeCubit homeCubit = getIt<HomeCubit>();
  bool isShowError = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            style: const TextStyle(
              fontSize: 25.0,
            ),
            controller: widget.textEditingController,
            textAlign: TextAlign.center,
            autofocus: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                         color: Color(0xFF01182e), width: 2, style: BorderStyle.solid),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                         color: Color(0xFF01182e), width: 2, style: BorderStyle.solid),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          isShowError
              ? const Text(
                  'Vượt quá số lượng',
                  style: TextStyle(color: Colors.red),
                )
              : const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  color: Color(0xFF01182e),
                  onPressed: () {
                    int orderQuantity =
                        int.parse(widget.textEditingController.text);
                    if (orderQuantity > widget.product.count) {
                      setState(() {
                        isShowError = true;
                      });
                    } else {
                      Navigator.pop(context);
                      widget.product.orderQuantity = orderQuantity;
                      getIt<HomeCubit>()
                          .addProductToCart(product: widget.product);
                      setState(() {
                        isShowError = false;
                      });
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
