abstract class Shop {
  void printName() {
  }
}

//interface
class IShop {
  late int count;
  IShop(this.count);

  void printCount() {
    print(count);
  }
}
