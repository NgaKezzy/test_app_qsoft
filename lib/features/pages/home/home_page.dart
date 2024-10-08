import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/component/loading/loading_widget.dart';
import 'package:test_app/di/dependency_injection.dart';
import 'package:test_app/features/cubit/home_cubit.dart';
import 'package:test_app/features/models/product.dart';
import 'package:test_app/features/pages/home/widgets/dialog_set_state.dart';
import 'package:test_app/routers/router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int value = 1;
  bool isShowLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 1500),
      () {
        setState(() {
          isShowLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: isShowLoading
          ? const Scaffold(
              body: Center(
                child: LoadingWidget(),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xFF01182e),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      'Sản phẩm',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routers.cart);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        size: 30,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              body: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Sản phẩm bán chạy',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.pink),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          _hotProduct(context),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Tất cả sản phẩm',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.pink),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          _allProduct(context),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Widget _hotProduct(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * 0.23,
      width: width,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              _product(context: context, product: hotProduct[index]),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: hotProduct.length),
    );
  }

  Widget _allProduct(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            childAspectRatio: 0.88,
            crossAxisSpacing: 20,
            crossAxisCount: 2),
        itemBuilder: (context, index) =>
            _itemAllProduct(context: context, product: allProduct[index]),
        itemCount: allProduct.length);
  }

  Widget _itemAllProduct(
      {required BuildContext context, required Product product}) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          child: Container(
            height: 130,
            width: width * 0.5,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: const BorderRadius.only(),
            ),
            child: Image.asset(
              product.image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: height * 0.07,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8))),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name),
                    Text(product.price.toString()),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showCustomBottomSheet(context, product);
                    },
                    child: const Icon(
                      Icons.add_shopping_cart,
                      color: Colors.orange,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _product({
    required BuildContext context,
    required Product product,
  }) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final HomeCubit homeCubit = getIt<HomeCubit>();

    return SizedBox(
      width: width * 0.35,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Container(
              height: height * 0.16,
              width: width * 0.35,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.only(),
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: height * 0.07,
            width: width * 0.35,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name),
                      Text(product.price.toString()),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        homeCubit.initData();
                        _showCustomBottomSheet(context, product);
                      },
                      child: const Icon(
                        Icons.add_shopping_cart,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCustomBottomSheet(BuildContext context, Product product) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      enableDrag: true,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => getIt<HomeCubit>(),
          child: DialogSetState(product: product),
        );
      },
    );
  }
}
