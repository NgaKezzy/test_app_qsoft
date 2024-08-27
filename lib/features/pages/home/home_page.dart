import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/features/models/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                'Home',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              Icon(
                Icons.shopping_cart,
                size: 30,
                color: Colors.white,
              ),
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
                      'Hot Product',
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
                      'All Product',
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
          itemBuilder: (context, index) => _product(
              context: context,
              count: hotProduct[index].count,
              id: hotProduct[index].id,
              image: hotProduct[index].image,
              name: hotProduct[index].name,
              price: hotProduct[index].price),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: hotProduct.length),
    );
  }

  Widget _allProduct(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            childAspectRatio: 0.88,
            crossAxisSpacing: 20,
            crossAxisCount: 2),
        itemBuilder: (context, index) => _itemAllProduct(
            context: context,
            id: allProduct[index].id,
            name: allProduct[index].name,
            image: allProduct[index].image,
            price: allProduct[index].price,
            count: allProduct[index].count),
        itemCount: allProduct.length);
  }

  Widget _itemAllProduct(
      {required BuildContext context,
      required int id,
      required String name,
      required String image,
      required double price,
      required int count}) {
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
            height: height * 0.2,
            width: width * 0.5,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(),
            ),
            child: Image.asset(
              image,
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
                    Text(name),
                    Text(price.toString()),
                  ],
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_shopping_cart,
                    color: Colors.orange,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _product(
      {required BuildContext context,
      required int id,
      required String name,
      required String image,
      required double price,
      required int count}) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
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
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(),
              ),
              child: Image.asset(
                image,
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
                      Text(name),
                      Text(price.toString()),
                    ],
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_shopping_cart,
                      color: Colors.orange,
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
}
