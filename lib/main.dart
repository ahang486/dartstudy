// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';

void main() {

  //runApp(const MyApp());
}

void ch1() {
  // 1-0.
  print('hello world');

  // 1-1. The var keyword
  // 일반적으로 var는 지역변수 일 때 권장
  var name = 'test'; // 생성값이 있으면 type 고정
  // compile error --> name = 1;
  name = 'update';
  name.length;

  String nameStr = 'test2';
  nameStr.length;

  // 1-2. Dynamic Type
  // ignore: prefer_typing_uninitialized_variables
  var intD;
  dynamic nameDD;

  // 외부에서 받은 자료를 dynamic으로 받아서 type 검증
  intD = 100;
  nameDD = 'xxx';

  if (nameDD is String) {
    nameDD.isNotEmpty;
  }
  if (intD is int) {
    intD.isEven;
  }

  // 1-3. Nullable Variables
  String nico = 'nico';
  nico.length;
  //nico = null; // 모든 변수의 default는 null 허용 안 함

  String? nullableNico = 'nuco';
  nullableNico = null;
  nullableNico?.isNotEmpty; // null이 아니라면 호출해줘

  // 1-4. Final Variables
  const nameF = 'nico';
  nameF.endsWith('x');
  //name_f = 'xx'; // error

  // 1-5. LAte Variables
  late final String nameLF;
  // do something,
  //print(nameLF); // error

  nameLF = 'from api';
  //name_lf = 'xxx'; // error
  nameLF.length;

  // 1-6. Constant Variables
  // compile time constans
  // compile 시점에 알고있는 값으로 제한
  // 화면이나 api를 통해 알게되는 값이라면 var, final 을 사용
  const maxLen = 100;
  while (maxLen < 1000) {
  }
}

void ch2() {
  // 2-0. Basic Data Types
  num x = 12;
  x = 1.1;
  x.isFinite;

  // 2-1. Lists
  var numbers = [1, 2, 3,];
  numbers.add(4);
  numbers.last;

  List<int> numS = [2, 4, 6];
  numS.add(1);

  var giveMeFive = true;
  var numIF = [
    1,
    2,
    if (giveMeFive) 5
  ];
  numIF.length;

  // 2-2. String Interpolation
  var name = 'nico';
  var age = 10;
  var greeting = 'hello, my name is $name and ${age + 2}';
  greeting.length;

  // 2-3. Collection For
  // 특히, Collection If는 UI에서 log in 여부 등을 다룰 때 매우 편해짐
  var oldFriends = ['A', 'B'];
  var newFriends = [
    'C', 'D', 'E',
    for (var friend in oldFriends) "* $friend"
  ];
  newFriends.length;

  // 2-4. Maps
  var player = {
    'name': 'nico',
    'xp': 19.99,
    'superpower': false
  };
  player.length;

  Map<int, bool> myP = {
    1: true,
    2: false,
  };
  myP.length;

  Map<List<int>, bool> myPL = {
    [1, 11, 21]: true,
    [2, 22, 32]: false,
  };
  myPL.length;

  // 2-5. Set
  var numSet = {1, 2, 3};
  numSet.add(1); // 중복이므로 영향 없음
}

void sayHello(String name) {
  print("Hello $name nice to meet you.");
}

String sayHelloDirect1({String name='anonymous', int age=0}) =>
    "Hello $name, $age";

// required로 강제화 시키거나, default value를 주도록 강제화 (안전!)
String sayHelloDirect2({required String name, int age=-1}) {
  return "Hello $name, $age";
}

String optionalPositionalArgs(String name, [int? age = -1]) =>
    "$name, $age";

String qq1(String? name) {
  if (name != null) return name.toUpperCase();
  return 'NULL';
}

String qq2(String? name) =>
    name != null ? name.toUpperCase() : 'NULL';

// ?? : 왼쪽이 null이 아닌 경우, 오른쪽이 null인 경우
String qq3(String? name) =>
    name?.toUpperCase() ?? 'NULL';

List<int> reverseInt(List<int> argList) {
  return argList.reversed.toList();
}

typedef ListInt = List<int>;
ListInt reverseInt2(ListInt argList) {
  return argList.reversed.toList();
}

String makeSen(Map<String, String> argMap) {
  return "$argMap['name']";
}

typedef UserInfo = Map<String, String>;
String makeSen2(UserInfo argMap) {
  return "$argMap['name']";
}

void ch3() {
  // 3-0. Defining a Function

  // 3-1. Named Parameters
  print(sayHelloDirect2(name: 'psy', age: 20));

  // 3-2. Recap
  // positional arguments : 사용을 지양하자.
  // named arguments : required 혹은 default value

  // 3-3. Optional Positional Parameters
  optionalPositionalArgs('test');

  // 3-4. QQ Operator
  // ??= null인 경우에만 값 부여
  String? name;
  name ??= 'NULL';
  name = null;
  name ??= 'NULL2';

  // 3-5. Typedef
  // 그냥 alias 역할로, 간단한 List/ Map 등 타이핑 줄이기용
}

class Player {
  final String name;
  int xp;

  Player(this.name, this.xp);

  void sayHello() {
    print('Name: $name, XP: $xp');
  }
}

abstract class Human {
  void walk();
}

class PlayerNamed extends Human {
  final String name;
  int xp;

  PlayerNamed({required this.name, required this.xp,});

  PlayerNamed.createZero({required this.name})
      : xp = 0;

  PlayerNamed.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        xp = json['xp'];

  void sayHello() {
    print('Name: $name, XP: $xp');
  }

  @override
  void walk() {
    print('walking');
  }
}

enum Team { red, blue }

class Person {
  final String name;

  Person({required this.name});

  void sayHello() { print('hello $name'); }
}

class Coach extends Person {
  Team team;

  Coach({required this.team, required String name})
      : super(name: name);

  @override
  void sayHello() {
    super.sayHello();
    print('$team');
  }
}

class Strong {
  final double strength = 99.9;
}

class Quick {
  void run() {
    print('ruuuun');
  }
}

class Tall {
  final int height = 199;
}

class SuperMan with Strong, Quick, Tall {}

class Baby with Quick {}

void ch4() {
  // 4-0. Your First Dart Class

  // 4-1. Constructors
  var pl = Player('psy', 3000);
  pl.sayHello();

  // 4-2. Named Constructor Parameters
  var plNamed = PlayerNamed(name: 'name', xp: 100);
  plNamed.sayHello();

  // 4-3. Named Constructors
  var plNamed2 = PlayerNamed.createZero(name: 'zero call');
  plNamed2.sayHello();

  // 4-4. Recap
  var jsonData =
      [
        {
          'name' : 'psy',
          'xp' : 100,
        },
        {
          'name' : 'lee',
          'xp' : 10,
        },
      ];

  jsonData.forEach((rawJ) {
    var pl = PlayerNamed.fromJson(rawJ);
    pl.sayHello();
  });

  // 4-5. Cascade Notation
  var plCa = PlayerNamed(name: 'name', xp: 100)
  ..xp = 200
  ..sayHello();

  plCa.sayHello();

  // 4-6. Enums
  Team team = Team.blue;
  print(team);

  // 4-7. Abstract Classes

  // 4-8. Inheritance
  var coach = Coach(team: Team.blue, name: 'park');
  coach.sayHello();

  // 4-9. Mixins
  // 생성자가 없는 class를 의미
  // 부모 관계로 상속받지 않고, 모든 프로퍼티, 메소드를 재조합 하는 것
  var superMan = SuperMan();
  superMan.run();
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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
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
