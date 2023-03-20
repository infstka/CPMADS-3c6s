import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lr3/entity.dart';
import 'package:lr3/iterator.dart';
import 'package:lr3/user.dart';

import 'dart:convert';

import 'iterable.dart';

void main() {
  runApp(const MyApp());
  initAssistant();
  comparableExample();
  iterableExample();
  iteratorExample();
  serializationExample();
  asyncExample();
  futureExample();

  var subscription = getSingleStreamData().listen((data) => print(data));
  subscription.onDone(() => print('Done!'));

  // var subscription2 = getSingleStreamData().listen((data) => print(data));
  // subscription2.onDone(() => print('Done!'));

  var broadcastStreamController = StreamController.broadcast();
  broadcastStreamController.stream.listen((event) {
    print('first subscription: $event');
  });
  broadcastStreamController.stream.listen((event) {
    print('second subscription: ${event + event}');
  });
  broadcastStreamController.sink.add(1);
  broadcastStreamController.sink.add(100);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

void initAssistant() {
  Assistant One = Assistant("One", "Shop1", 19);
  One.showName();
  One.placeOfWork();
}

void comparableExample() {
  print("\n");
  Assistant One = Assistant("One", "Shop1", 19);
  Assistant Two = Assistant("Two", "Shop2", 21);
  print(One.compareTo(Two));
  print(Two.compareTo(One));
}

void iterableExample() {
  print("\n");
  Assistant One = Assistant("One", "Shop1", 19);
  Assistant Two = Assistant("Two", "Shop2", 21);
  Assistant Three = Assistant("Three", "Shop3", 23);

  var assistants = [One, Two, Three];

  var shopAssistant1 = ShopWorker1(assistants);
  var firstTwoAssistants = shopAssistant1.take(3);
  print(shopAssistant1.iterator);
  for (var assistant in firstTwoAssistants) {
    print(assistant.name);
  }
}

void iteratorExample() {
  print("\n");
  Assistant One = Assistant("One", "Shop1", 19);
  Assistant Two = Assistant("Two", "Shop2", 21);
  Assistant Three = Assistant("Three", "Shop3", 23);

  var assistants = [One, Two, Three];

  var shopAssistant2 = ShopAssistant2(assistants);

  while (shopAssistant2.moveNext()) {
    print(shopAssistant2.current.name);
  }
}

void serializationExample() {
  print("\n");
  User One = User("One", 19);
  var json = One.toJSON();
  print(json);
  var userFromJson = One.fromJSON(json);
  print(userFromJson.name + " " + userFromJson.age.toString());
}

Future<void> doWork() async {
  print("Start doWork");
  String message = await getAsyncMessage();
  print("Got message: $message");
  print("End doWork");
}

Future<String> getAsyncMessage() {
  // имитация долгой работы с помощью задержки в 3 секунды
  return Future.delayed(Duration(seconds: 3), () => "Hello Dart");
}

void asyncExample() {
  print("\n");
  doWork();
  print("Call after doWork function");
}

Future getMessage() {
  // для эмуляции длительной операции делаем задержку в 3 секунды
  return Future.delayed(
      Duration(seconds: 3), () => print("You got the message from me"));
}

void futureExample() {
  print("\n");
  getMessage();
  print("I call this print after getMessage func");
}

Stream<int> getSingleStreamData() {
  final controller = StreamController<int>();
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
  controller.close();
  return controller.stream;
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
