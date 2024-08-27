import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/features/models/product.dart';
import 'package:test_app/routers/router.dart';

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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 30,
              ),
              const Text(
                'Home',
                style: TextStyle(fontSize: 22, color: Colors.white),
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
          itemBuilder: (context, index) =>
              _product(context: context, product: hotProduct[index]),
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
            height: height * 0.2,
            width: width * 0.5,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(),
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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      isDismissible: true, // Cho phép đóng khi nhấn ra ngoài
      enableDrag: true, // Cho phép kéo để đóng
      builder: (BuildContext context) {
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
                          child: Image.asset(product.image),
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
                                  color: Colors.grey,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.remove)),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);

                                    _dialogBuilder(context, product);
                                  },
                                  child: const Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
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
                const Spacer(),
                SizedBox(
                  width: width * 0.9,
                  child: MaterialButton(
                      color: Colors.orange,
                      onPressed: () {},
                      child: const Text(
                        'Add to cart',
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
      },
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
