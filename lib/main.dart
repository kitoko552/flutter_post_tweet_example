import 'dart:io' show Platform;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() => runApp(new App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) => _buildApp();

  Widget _buildApp() {
    if (Platform.isIOS) {
      return WidgetsApp(
        color: Colors.blue,
        builder: (context, widget) {
          return Home();
        },
      );
    } else {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      );
    }
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  static const channel = MethodChannel('com.kitoko552.flutter_post_tweet_example/tweet');

  @override
  Widget build(BuildContext context) => _buildScaffold();

  Widget _buildScaffold() {
    final Text title = Text('Post Tweet Example');
    final Widget body = Center(
      child: Container(
        child: _buildButton(context)
      )
    );

    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: title,
        ),
        child: body
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: title,
        ),
        body: body
      );
    }
  }

  Widget _buildButton(BuildContext context) {
    Text buildText(Color color) {
      return Text(
        'TWEET',
        style: TextStyle(
          color: color
        ),
      );
    }

    if (Platform.isIOS) {
      return CupertinoButton(
        child: buildText(Colors.blue),
        pressedOpacity: 0.4,
        onPressed: _onPressedButton
      );
    } else {
      return RaisedButton(
        child: buildText(Colors.white),
        color: Theme.of(context).accentColor,
        onPressed: _onPressedButton
      );
    }
  }

  Future<void> _onPressedButton() async {
    try {
      await channel.invokeMethod('tweet');
    } on PlatformException catch (e) {
      print(e);
    }
  }
}