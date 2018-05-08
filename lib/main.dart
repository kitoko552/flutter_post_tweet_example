import 'dart:io' show Platform;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

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
  static const platform = const MethodChannel('com.kitoko552.flutter_post_tweet_example/tweet');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Post Tweet Example')
      ),
      body: new Center(
        child: new Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: _buildButton(context)
        )
      )
    );
  }

  Widget _buildButton(BuildContext context) {
    if (Platform.isIOS) {
      return new CupertinoButton(
          child: _buildButtonText(),
          color: Theme.of(context).accentColor,
          onPressed: _onPressedButton
      );
    } else {
      return new RaisedButton(
          child: _buildButtonText(),
          color: Theme.of(context).accentColor,
          onPressed: _onPressedButton
      );
    }
  }

  Text _buildButtonText() {
    return new Text(
      'TWEET',
      style: new TextStyle(
        color: Colors.white
      ),
    );
  }

  Future<void> _onPressedButton() async {
    try {
      await platform.invokeMethod('tweet');
    } on PlatformException catch (e) {
      print(e);
    }
  }
}