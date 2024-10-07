// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  Product(
      {required this.name,
      required this.price,
      required this.count,
      required this.image,
      required this.id,
      this.orderQuantity = 0});
  final int id;
  final String name;
  final double price;
  final int count;
  final String image;
  int? orderQuantity;
}

final List<Product> hotProduct = [
  Product(
      id: 1,
      name: 'Nước hoa #1',
      price: 22087000,
      count: 100,
      image: 'assets/images/1.png'),
  Product(
      id: 2,
      name: 'Nước hoa #2',
      price: 2280000,
      count: 100,
      image: 'assets/images/2.png'),
  Product(
      id: 3,
      name: 'Nước hoa #3',
      price: 40020000,
      count: 100,
      image: 'assets/images/3.png'),
  Product(
      id: 4,
      name: 'Nước hoa #4',
      price: 22120000,
      count: 100,
      image: 'assets/images/5.png'),
  Product(
      id: 5,
      name: 'Nước hoa #5',
      price: 2200400,
      count: 100,
      image: 'assets/images/5.png'),
  Product(
      id: 6,
      name: 'Nước hoa #6',
      price: 2240000,
      count: 100,
      image: 'assets/images/6.png'),
  Product(
      id: 7,
      name: 'Nước hoa #7',
      price: 2205000,
      count: 100,
      image: 'assets/images/7.png'),
  Product(
      id: 8,
      name: 'Nước hoa #8',
      price: 2200600,
      count: 100,
      image: 'assets/images/8.png'),
  Product(
      id: 9,
      name: 'Nước hoa #9',
      price: 2270000,
      count: 100,
      image: 'assets/images/9.png'),
  Product(
      id: 10,
      name: 'Nước hoa #10',
      price: 2200080,
      count: 100,
      image: 'assets/images/10.png'),
];

final List<Product> allProduct = [
  Product(
      id: 11,
      name: 'Nước hoa #11',
      price: 2204000,
      count: 100,
      image: 'assets/images/11.png'),
  Product(
      id: 12,
      name: 'Nước hoa #12',
      price: 2201000,
      count: 100,
      image: 'assets/images/12.png'),
  Product(
      id: 13,
      name: 'Nước hoa #13',
      price: 2203000,
      count: 100,
      image: 'assets/images/10.png'),
  Product(
      id: 14,
      name: 'Nước hoa #14',
      price: 2240000,
      count: 100,
      image: 'assets/images/14.png'),
  Product(
      id: 15,
      name: 'Nước hoa #15',
      price: 2205000,
      count: 100,
      image: 'assets/images/15.png'),
  Product(
      id: 16,
      name: 'Nước hoa #16',
      price: 2200600,
      count: 100,
      image: 'assets/images/16.png'),
  Product(
      id: 17,
      name: 'Nước hoa #17',
      price: 2201000,
      count: 100,
      image: 'assets/images/17.png'),
  Product(
      id: 18,
      name: 'Nước hoa #18',
      price: 3220000,
      count: 100,
      image: 'assets/images/18.png'),
  Product(
      id: 19,
      name: 'Nước hoa #19',
      price: 4220000,
      count: 100,
      image: 'assets/images/19.png'),
  Product(
      id: 20,
      name: 'Nước hoa #20',
      price: 3220000,
      count: 100,
      image: 'assets/images/20.png'),
  Product(
      id: 21,
      name: 'Nước hoa #21',
      price: 1220000,
      count: 100,
      image: 'assets/images/21.png'),
  Product(
      id: 22,
      name: 'Nước hoa #22',
      price: 4220000,
      count: 100,
      image: 'assets/images/22.png'),
  Product(
      id: 23,
      name: 'Nước hoa #23',
      price: 5220000,
      count: 100,
      image: 'assets/images/23.png'),
  Product(
      id: 24,
      name: 'Nước hoa #24',
      price: 6220000,
      count: 100,
      image: 'assets/images/25.png'),
  Product(
      id: 25,
      name: 'Nước hoa #25',
      price: 9220000,
      count: 100,
      image: 'assets/images/25.png'),
  Product(
      id: 26,
      name: 'Nước hoa #26',
      price: 7220000,
      count: 100,
      image: 'assets/images/26.png'),
  Product(
      id: 27,
      name: 'Nước hoa #27',
      price: 220000,
      count: 100,
      image: 'assets/images/27.png'),
  Product(
      id: 28,
      name: 'Nước hoa #28',
      price: 220000,
      count: 100,
      image: 'assets/images/28.png'),
  Product(
      id: 29,
      name: 'Nước hoa #29',
      price: 220000,
      count: 100,
      image: 'assets/images/29.png'),
  Product(
      id: 30,
      name: 'Nước hoa #30',
      price: 220000,
      count: 100,
      image: 'assets/images/30.png'),
];
