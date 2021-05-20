/// A Flutter plugin to easily display and dispose overlay
/// screens anywhere in your app.
library overlay_screen;

import 'package:flutter/material.dart';

/// State of the [OverlayScreen].
enum Screen {
  /// Already [OverlayScreen] showing.
  showing,

  /// No [OverlayScreen] showing.
  none,
}

/// Displays and dispose a [Dialog]
/// that works like an overlay screen.
class OverlayScreen {
  OverlayScreen._internal();
  static final OverlayScreen _instance = OverlayScreen._internal();

  /// Singleton constructor.
  factory OverlayScreen() => _instance;

  Screen _state = Screen.none;
  BuildContext? _overlayScreenContext;
  final Map<String, CustomOverlayScreen> _customOverLayScreens = {
    'default-loading': CustomOverlayScreen(
      backgroundColor: Colors.transparent,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(height: 20.0),
          Text(
            "loading...",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    )
  };

  /// Getter to know the state of the [OverlayScreen].
  Screen get state => _state;

  /// This method saves widgets to show by [show].
  void saveScreens(Map<String, CustomOverlayScreen> widgets) =>
      _instance._customOverLayScreens.addAll(widgets);

  /// This method removes widgets to show by [show].
  void removeScreens(List<String> identifiers) => identifiers.forEach(
      (identifier) => _instance._customOverLayScreens.remove(identifier));

  /// This method displays a [OverlayScreen] by an identifier.
  void show(
    BuildContext context, {
    String identifier = 'default-loading',
  }) {
    assert(_instance._customOverLayScreens.isNotEmpty, "overlay screens empty");
    assert(_customOverLayScreens.containsKey(identifier), "widget not found");
    assert(_instance._state == Screen.none, "already showing screen");
    _instance._state = Screen.showing;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        _instance._overlayScreenContext = context;
        return _customOverLayScreens[identifier]!;
      },
    );
  }

  /// This method dispose the [OverlayScreen].
  void pop() {
    assert(_instance._state == Screen.showing, "no screen displayed");
    Navigator.pop(_instance._overlayScreenContext!);
    _instance._overlayScreenContext = null;
    _instance._state = Screen.none;
  }
}

/// Custom widget to display in a [OverlayScreen].
class CustomOverlayScreen extends StatelessWidget {
  /// Backgroundcolor for [OverlayScreen].
  final Color backgroundColor;

  /// Custom content for [OverlayScreen].
  final Widget content;

  /// CustomOverlayScreen constructor.
  CustomOverlayScreen({
    required this.content,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: backgroundColor,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      content: Container(
        height: size.height,
        width: size.width,
        child: content,
      ),
    );
  }
}
