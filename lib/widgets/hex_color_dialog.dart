import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'package:svg_colorization/providers/previous_color.dart';
import 'package:svg_colorization/providers/svg_data.dart';
import 'package:svg_colorization/utils/util.dart';
import 'package:svg_colorization/widgets/color_text_field.dart';

/// A [ColorPicker] widget wrapped in an [AlertDialog].
///
/// Returns the selected hex color value.
class HexColorDialog extends StatelessWidget {
  const HexColorDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final svg = context.read<SVGData>();

    final previousColor = context.read<PreviousColor>();

    final textController = TextEditingController(text: previousColor.value);

    return AlertDialog(
      scrollable: true,
      insetPadding: const EdgeInsets.only(right: 800, bottom: 20),
      titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(0),
      content: SingleChildScrollView(
        child: Column(
          children: [
            ColorPicker(
              pickerColor: HexColor(previousColor.value),
              onColorChanged: (color) {
                String hexColor = Util.colorToHexString(color);
                svg.updateCode(previousColor.value, hexColor);
                previousColor.updateValue(hexColor);
              },
              colorPickerWidth: 300,
              pickerAreaHeightPercent: 0.7,
              enableAlpha: true,
              displayThumbColor: true,
              paletteType: PaletteType.hsvWithHue,
              labelTypes: const [],
              pickerAreaBorderRadius: const BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(2),
              ),
              hexInputController: textController,
              portraitOnly: true,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: ColorTextField(colorTextController: textController),
            )
          ],
        ),
      ),
    );
  }
}
