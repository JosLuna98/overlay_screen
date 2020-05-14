# Overlay Screen

A Flutter plugin to easily display and dispose overlay screens anywhere in your app.

![](https://raw.githubusercontent.com/JosLuna98/overlay_screen/master/screenshots/untitled.gif)

**NOTE:** This package was made with Flutter 1.17 and Dart 2.8, make sure you have your environment within the version range.
```yaml
environment:
  sdk: ">=2.7.0 <3.0.0"
  flutter: ">=1.10.0"
```

## Getting Started

To use this plugin, add `overlay_screen` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/). For example:

```yaml
dependencies:
  overlay_screen: ^1.2.0
```

## Usage

Import the package:
```dart
import 'package:overlay_screen/overlay_screen.dart';
```

**NOTE:** It's not necessary to set a variable of the class like:
```dart
OverlayScreen loading = OverlayScreen();
```
You can just call the `OverlayScreen()` class and use its methods like:
```dart
OverlayScreen().show(context);
```

### Functions

* **saveScreens**

This method takes a `Map<String, CustomOverlayScreen>`to save it and allows you to use it later with the `show` method.

```dart
OverlayScreen().saveScreens({
  String: CustomOverlayScreen(
    backgroundColor: Color,
    content: Widget, 
  ),
  String: CustomOverlayScreen(
    backgroundColor: Color,
    content: Widget, 
  ),
  String: CustomOverlayScreen(
    backgroundColor: Color,
    content: Widget, 
  ),
  ...
});
```

* **removeScreens**

This method removes widgets to display by `show`.

```dart
OverlayScreen().removeScreens([String, String, String...]);
```

* **show**

This method displays an `OverlayScreen` by an identifier.

```dart
OverlayScreen().show(
  BuildContext context,
  identifier: String,
);
```

* **pop**

This method dispose an `OverlayScreen` displayed.

```dart
OverlayScreen().pop();
```

* **state**

OverlayScreen also has the `state` getter to know if a overlay screen is displayed when it is `Screen.showing` or nothing is displayed when it is `Screen.none`.

```dart
OverlayScreen().state;
```

##  License

MIT License
