class Person {
  String name;

  Person(this.name);

  void showName() {
    print("Name: $name");
  }
}

class ShopAssistant {
  String shop = "";

  void placeOfWork() {
    print("Work in $shop");
  }
}

class Assistant extends Person with ShopAssistant implements Comparable<Assistant> {
  int age;
  Assistant(name, shopAssistant, this.age) : super(name) {
    shop = shopAssistant;
  }

  @override
  int compareTo(Assistant emp){
    return age.compareTo(emp.age);
  }
}
