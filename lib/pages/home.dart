import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:svg_colorization/providers/previous_color.dart';
import 'package:svg_colorization/providers/svg_data.dart';
import 'package:svg_colorization/widgets/scene_renderer.dart';
import 'package:svg_colorization/widgets/slider_options.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Holds the [SVData] object.
    final svg = context.read<SVGData>();

    /// Holds the [PreviousColor] object.
    final previousColor = context.read<PreviousColor>();

    return Scaffold(
      body: Column(
        children: [
          const SceneRenderer(),
          Expanded(
            child: SliderOptions(
              onColorSelected: (String hexColor) {
                // Replace the svg previous color value with the current [hexColor].
                svg.updateCode(previousColor.value, hexColor);

                // Update the previous color [value].
                previousColor.updateValue(hexColor);
              },
            ),
          ),
        ],
      ),
    );
  }
}
