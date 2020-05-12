import 'package:flutter/material.dart';
import 'dart:async';

import 'package:loading_screen/loading_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoadingScreen().saveCustomWidgets({
      'dialog': CustomLoadingScreen(
        child: Dialog(
          child: SizedBox(
            height: 180.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text('Loading...'),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      'custom2': CustomLoadingScreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 80.0,
            ),
            Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text("Let's start!"))
          ],
        ),
        backgroundColor: Colors.white,
      ),
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Plugin example app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("standard loading"),
              onPressed: () async {
                LoadingScreen().begin(context);
                await Future.delayed(
                    Duration(seconds: 2), () => print("loading something"));
                LoadingScreen().end();
              },
            ),
            RaisedButton(
              child: Text("personalized loading"),
              onPressed: () async {
                LoadingScreen().begin(
                  context,
                  child: Icon(
                    Icons.backup,
                    color: Colors.white,
                  ),
                  message: "Uploading data...",
                  messageStyle: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                  backgroundColor: Colors.blue.withOpacity(0.8),
                );
                await Future.delayed(
                    Duration(seconds: 2), () => print("loading something"));
                LoadingScreen().end();
              },
            ),
            RaisedButton(
              child: Text("dialog loading"),
              onPressed: () async {
                LoadingScreen().beginCustom(context, identifier: 'dialog');
                await Future.delayed(
                    Duration(seconds: 2), () => print("loading something"));
                LoadingScreen().end();
              },
            ),
            RaisedButton(
              child: Text("custom2 loading"),
              onPressed: () async {
                LoadingScreen().beginCustom(context, identifier: 'custom2');
                await Future.delayed(
                    Duration(seconds: 2), () => print("loading something"));
                LoadingScreen().end();
              },
            ),
          ],
        ),
      ),
    );
  }
}
