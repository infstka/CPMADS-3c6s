class User {
  String name;
  int age;

  User(this.name, this.age);

  Map<String, dynamic> toJSON() => {
        'name': name,
        'age': age,
      };

  User fromJSON(Map<String, dynamic> json) {
    User userFromJSON = User("", 0);
    userFromJSON.name = json['name'];
    userFromJSON.age = json['age'];
    return userFromJSON;
  }
}
