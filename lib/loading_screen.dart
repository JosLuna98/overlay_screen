import 'package:flutter/material.dart';

/// State of the loading screen.
enum Load {
  /// Nothing is loading.
  closed,

  /// Something is loading.
  processing,
}

/// Displays and dispose a [Dialog]
/// that works like a loading screen.
class LoadingScreen {
  static final LoadingScreen _instance = LoadingScreen._internal();

  /// Singleton constructor.
  factory LoadingScreen() => _instance;
  LoadingScreen._internal();

  Load _state = Load.closed;
  BuildContext _dContext;
  final Map<String, CustomLoadingScreen> _customLoadingScreen =
      Map<String, CustomLoadingScreen>();

  /// Getter to know the state of the [LoadingScreen].
  Load get state => _state;

  /// This method saves widgets to show with [beginCustom].
  void saveCustomWidgets(Map<String, CustomLoadingScreen> widgets) {
    _instance._customLoadingScreen.addAll(widgets);
  }

  /// This method displays a custom [LoadingScreen] by identifier.
  void beginCustom(
    BuildContext context, {
    @required String identifier,
  }) {
    assert(_instance._customLoadingScreen != null,
        "must first configure at least one custom widget");
    assert(_customLoadingScreen.containsKey(identifier), "widget not found");
    assert(_instance._state == Load.closed, "already loading");
    _instance._state = Load.processing;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dContext) {
        _instance._dContext = dContext;
        return _customLoadingScreen[identifier];
      },
    );
  }

  /// This method displays the [LoadingScreen].
  void begin(
    BuildContext context, {
    Widget child = const CircularProgressIndicator(),
    String message,
    TextStyle messageStyle = const TextStyle(color: Colors.white),
    Color backgroundColor = Colors.transparent,
  }) {
    assert(_instance._state == Load.closed, "already loading");
    _instance._state = Load.processing;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dContext) {
        _instance._dContext = dContext;
        return _LoadingScreenWidget(
          child,
          message,
          messageStyle,
          backgroundColor,
        );
      },
    );
  }

  /// This method dispose the [LoadingScreen].
  void end() {
    assert(_instance._state == Load.processing, "nothing loading");
    Navigator.of(_instance._dContext).pop();
    _instance._dContext = null;
    _instance._state = Load.closed;
  }
}

class _LoadingScreenWidget extends StatelessWidget {
  final child;
  final message;
  final messageStyle;
  final backgroundColor;

  _LoadingScreenWidget(
    this.child,
    this.message,
    this.messageStyle,
    this.backgroundColor,
  );

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            child,
            if (message != null)
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  message,
                  style: messageStyle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Custom widget to display in a [LoadingScreen].
class CustomLoadingScreen extends StatelessWidget {
  /// Custom content for [LoadingScreen].
  final Widget child;

  /// Backgroundcolor for [LoadingScreen].
  final Color backgroundColor;

  /// CustomLoadingScreen constructor.
  CustomLoadingScreen({
    @required this.child,
    @required this.backgroundColor,
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
        child: child,
      ),
    );
  }
}
