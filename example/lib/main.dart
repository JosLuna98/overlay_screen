import 'package:flutter/material.dart';
import 'dart:async';

import 'package:overlay_screen/overlay_screen.dart';

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
    OverlayScreen().saveScreens({
      'dialog': CustomOverlayScreen(
        backgroundColor: Colors.transparent,
        content: Dialog(
          child: SizedBox(
            height: 180.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'No internet connection!!',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Text(
                  "waiting..",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  height: 20.0,
                  width: 20.0,
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
      'custom1': CustomOverlayScreen(
        backgroundColor: Colors.blue.withOpacity(0.5),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.backup,
              color: Colors.white,
            ),
            SizedBox(height: 10.0),
            Text(
              "Uploading data...",
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
      'custom2': CustomOverlayScreen(
        backgroundColor: Colors.yellow[400],
        content: Column(
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
              child: Text("default loading"),
              onPressed: () async {
                OverlayScreen().show(context);
                await Future.delayed(
                  Duration(seconds: 2),
                  () => print("loading something"),
                );
                OverlayScreen().pop();
              },
            ),
            RaisedButton(
              child: Text("dialog loading"),
              onPressed: () async {
                OverlayScreen().show(
                  context,
                  identifier: 'dialog',
                );
                await Future.delayed(
                  Duration(seconds: 2),
                  () => print("loading something"),
                );
                OverlayScreen().pop();
              },
            ),
            RaisedButton(
              child: Text("custom1 overlay"),
              onPressed: () async {
                OverlayScreen().show(
                  context,
                  identifier: 'custom1',
                );
                await Future.delayed(
                  Duration(seconds: 2),
                  () => OverlayScreen().pop(),
                );
              },
            ),
            RaisedButton(
              child: Text("custom2 overlay"),
              onPressed: () async {
                OverlayScreen().show(
                  context,
                  identifier: 'custom2',
                );
                await Future.delayed(
                  Duration(seconds: 2),
                  () => OverlayScreen().pop(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
