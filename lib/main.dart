import 'package:flutter/material.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Post Tweet Example')
      ),
      body: new Center(
        child: new Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: new TextField(
            decoration: new InputDecoration(hintText: 'write tweet here.'),
          ),
        )
      )
    );
  }
}