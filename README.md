# SVG Colorization

A tutorial that demonstrates how to switch colors of an SVG file in Flutter.

## Project Structure

All the `code` has been written as per the [best practices](https://dart.dev/guides/language/effective-dart/documentation). The below folder structure has been adopted to make the `code` look more understandable.

```dart
svg_colorization
├─ assets
│  └─ car_front.svg /// The SVG File.
├─ lib
│  ├─ pages
│  │  └─ home.dart 
│  ├─ providers
│  │  └─ previous_color.dart /// A [ChangeNotifier] that holds the previous hex color value.
│  │  └─ svg_data.dart /// A [ChangeNotifier] that holds the svg text data.
│  ├─ utils
│  │  └─ util.dart /// A class that handles basic utility functions.
│  ├─ widgets
│  │  └─ circular_button.dart /// A Custom Rounded [Container] widget.
│  │  └─ color_text_field.dart /// A [CupertinoTextField] widget that copies the selected or typed color.
│  │  └─ hex_color_dialog.dart /// A [ColorPicker] widget wrapped in an [AlertDialog].
│  │  └─ scene_renderer.dart /// An [SvgPicture] widget that renders the svg.
│  │  └─ slider_options.dart /// A Custom [Widget] that allows Default & Custom Color Switching with SVG File Saving operations.
│  ├─ main.dart
├─ web
│  ├─ index.html
├─ pubspec.lock
├─ pubspec.yaml
```

## TOOLS & LANGUAGE

- [Microsoft Visual Studio Code](https://code.visualstudio.com/download)
- [Flutter](https://flutter.dev/)

## Developer

[Zujaj Misbah Khan](https://github.com/Zujaj)
