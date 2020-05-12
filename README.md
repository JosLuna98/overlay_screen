# Loading Screen

A Flutter plugin to easily display and dispose standard or custom loading screens anywhere in your app.

>**NOTE:** This package was made with Flutter 1.17 and Dart 2.8, make sure you have your environment within the version range.
>```yaml
>environment:
>  sdk: ">=2.7.0 <3.0.0"
>  flutter: ">=1.10.0"
>```

![](https://raw.githubusercontent.com/JosLuna98/loading_screen/master/screenshots/untitled.gif)

## Getting Started

To use this plugin, add `loading_screen` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/). For example:

```yaml
dependencies:
  loading_screen: ^1.0.0
```

## Usage

Import the package:
```dart
import 'package:loading_screen/loading_screen.dart';
```

>**NOTE:** It's not necessary to set a variable of the class like:
>```dart
>LoadingScreen loading = LoadingScreen();
>```
>You can just call the `LoadingScreen()` class and use it's methods like:
>```dart
>LoadingScreen().begin(context);
>```

### Functions

* **begin**

This method displays a standard loading screen, just send the context parameter. The rest of the parameters are optional and personalize the screen a little.

```dart
LoadingScreen().begin(
  BuildContext context,
  child: Widget,
  message: String,
  messageStyle: TextStyle,
  backgroundColor: Color,
);
```

* **saveCustomWidgets**

This method takes a `Map<String, CustomLoadingScreen()>`to save it and allows you to use it later with the beginCustom method.

```dart
LoadingScreen().saveCustomWidgets({
  String: CustomLoadingScreen(
    child: Widget, 
    backgroundColor: Color,
  ),
  String: CustomLoadingScreen(
    child: Widget, 
    backgroundColor: Color,
  ),
  String: CustomLoadingScreen(
    child: Widget, 
    backgroundColor: Color,
  ),
  ...
});
```

* **beginCustom**

This method is like the begin method but will display a customLoadingScreen saved that is selected by identifier parameter.

```dart
LoadingScreen().beginCustom(BuildContext context, identifier: String);
```

* **end**

This method dispose the loading screen.

```dart
LoadingScreen().end();
```

##  License

MIT License
