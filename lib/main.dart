import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:svg_colorization/pages/home.dart';
import 'package:svg_colorization/providers/previous_color.dart';
import 'package:svg_colorization/providers/svg_data.dart';

/// Holds the svg asset text.
String svgCode = '';

void main() async {
  // Do Not Remove This Line.
  WidgetsFlutterBinding.ensureInitialized();

  // Extract The Text From The Asset SVG File.
  svgCode = await rootBundle.loadString("assets/car_front.svg");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SVGData>.value(
          value: SVGData(svgCode),
        ),
        ChangeNotifierProvider<PreviousColor>.value(
            value: PreviousColor('#f7ebcb'))
      ],
      child: MaterialApp(
        title: 'SVG Colorization',
        debugShowCheckedModeBanner: false,
        scrollBehavior: CustomScrollBehavior(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
