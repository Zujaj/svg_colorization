import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'package:svg_colorization/providers/svg_data.dart';
import 'package:svg_colorization/utils/util.dart';
import 'package:svg_colorization/widgets/circular_button.dart';
import 'package:svg_colorization/widgets/hex_color_dialog.dart';

/// A Custom [Widget] that allows operations like
/// 1. Default & Custom Color Switching
/// 2. SVG File Saving.
class SliderOptions extends StatelessWidget {
  /// Holds the color name with hex value.
  final _colorMap = {
    'Red': '#FF0000',
    'Green': '#008000',
    'Leaf': '#22B14C',
    'Blue': '#4068B2',
    'Orange': '#FF4800',
    'Yellow': '#FFFF00',
    'Navy': '#000080',
    'Magenta:': '#FF00FF',
    'Indigo': '#4B0082',
    'Turquoise': '#40E0D0',
    'Beige': '#D9B382',
    'Silver': '#5B5C5C',
  };

  /// Triggers when tapped on a color.
  final Function(String) onColorSelected;

  SliderOptions({Key? key, required this.onColorSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        /// Loads the Circular Containers With Hex Colors.
        ..._colorMap.entries.map((MapEntry<String, String> mapEntry) {
          return CircularButton(
            innerColor: HexColor(mapEntry.value),
            onTap: () => onColorSelected(mapEntry.value),
            shadow: [
              BoxShadow(color: HexColor(mapEntry.value)),
            ],
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Text(
                mapEntry.key.split(':')[0].split('.')[0].toUpperCase(),
                style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 12)),
              ),
            ),
          );
        }),

        /// Pops Up The [HexColorDialog] widget.
        CircularButton(
          innerColor: Colors.teal,
          child: const Icon(Icons.colorize_outlined, color: Colors.white),
          onTap: () async => showDialog(
              context: context,
              barrierColor: Colors.transparent,
              builder: (context) => const HexColorDialog()),
        ),

        /// Saves The Rendered Image to SVG.
        CircularButton(
          innerColor: Colors.pink,
          child: const Icon(Icons.save_alt, color: Colors.white),
          onTap: () async => Util.saveAsSVG(context.read<SVGData>().code),
        ),
      ],
    );
  }
}
