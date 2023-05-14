import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lr7_8/directories.dart';
import 'package:lr7_8/sharedpreferences.dart';
import 'package:lr7_8/sqflite_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'hive.dart';
import 'person_adapter.dart';

void main() {
  runApp(const MyApp());

  initHive();
}

Future<void> initHive() async {
  Hive.registerAdapter(PersonAdapter());
  await Hive.initFlutter();
  final hiveDB = HiveDB();

  // Creating a new person
  final person = Person(name: 'test1', age: 1, address: 'testaddr1', phone: '111');
  final person2 = Person(name: 'test2', age: 2, address: 'testaddr2', phone: '222');

  await hiveDB.addPerson(person);
  await hiveDB.addPerson(person2);

  //await hiveDB.delAll();

  // Reading all persons
  List<Person> persons = await hiveDB.getAllPersons();
  for (int i =0;i<persons.length;i++){
    print('${persons[i].name}  ${persons[i].age}  ${persons[i].address}  ${persons[i].phone}');
  }

  // Updating a person
  final updatedPerson = Person(name: 'test', age: 01, address: 'testaddr', phone: '0');
  await hiveDB.updatePerson(0, updatedPerson);
  persons = await hiveDB.getAllPersons();

  for (int i =0;i<persons.length;i++){
    print('${persons[i].name}  ${persons[i].age}  ${persons[i].address}  ${persons[i].phone}');
  }
  // Deleting a person
  await hiveDB.deletePerson(0);
  persons = await hiveDB.getAllPersons();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'LR7-8'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {});
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        HomePage(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
              ),
              child: const Text(
                "sqflite",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        SharedPreferencesPage(title: "shared preferences"),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
              ),
              child: const Text(
                "shared preferences",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        FileIOExample(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
              ),
              child: const Text(
                "directories",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}