import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // theme: ThemeData.dark().copyWith(
      //   textTheme: TextTheme(
      //       bodyText1: TextStyle(
      //           fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
      //       displayLarge: TextStyle(
      //           fontSize: 60,
      //           color: Colors.white,
      //           fontWeight: FontWeight.w900)),
      // ),
      home: HomeView(title: 'Flutter in 15 min'),
    );
  }
}

class HomeView extends StatefulWidget {
  final String title;
  const HomeView({Key? key, required this.title}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _counter = 0;

  void incremenCounter() {
    setState(() {
      _counter++;
    });
  }

  void decreseCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  void resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  List<Color> _color = [
    Colors.blueAccent,
    Colors.redAccent,
    Colors.deepPurpleAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color[_counter % _color.length],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        //elevation: 0.0,
        title: Text(widget.title),
        centerTitle: true,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: resetCounter,
            child: Icon(Icons.refresh),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: decreseCounter,
            child: Icon(Icons.remove),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: incremenCounter,
            child: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Tapped button this many times: ',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '$_counter',
                style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              )
            ]),
      ),
    );
  }
}
