import 'package:lr2/shop.dart';

class FirstShop extends Shop implements IShop {
  @override
  late int count = 0;
  String name = "null";

  FirstShop(this.name, this.count);

  @override
  void printCount() {
    print("Shop $name have $count shops in the world");
  }

  @override
  void printName() {
    print("Shop name: $name");
  }

  void openOrClose(String word) {
    print("$name status is: $word");
  }
}

class SecondShop extends Shop implements IShop {
  @override
  late int count;
  String shopName;

  String get name {
    return shopName;
  }

  void set name(String spec) {
    name = "$spec $name";
  }

  @override
  void printName() {
    print("Shop name: $name");
  }

  void openOrClose(String word) {
    print("$name status is: $word");
  }

  @override
  void printCount() {
    print("Shop $name have $count shops in the world");
  }

  SecondShop(this.shopName, this.count);
}

class ThirdShop {
  String ?name;
  late int count;

  void printName() {
    print("Shop name: $name");
  }

  void openOrClose(String word) {
    print("$name status is: $word");
  }

  void updateShopCount([int count = 2]) {
    print("$name get $count new shops");
  }

  void shopName(void Function(String value) printShopName) {
    printShopName(name!);
  }

  ThirdShop.NamedConstructor(this.name, this.count);
}