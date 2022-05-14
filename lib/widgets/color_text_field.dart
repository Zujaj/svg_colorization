import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:svg_colorization/utils/util.dart';

/// A [CupertinoTextField] widget that copies the selected or typed color.
class ColorTextField extends StatelessWidget {
  const ColorTextField({
    Key? key,
    required this.colorTextController,
  }) : super(key: key);

  final TextEditingController colorTextController;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: colorTextController,
      prefix: const Padding(
          padding: EdgeInsets.only(left: 8), child: Icon(Icons.tag)),
      suffix: IconButton(
        icon: const Icon(Icons.content_paste_rounded),
        onPressed: () async => Util.copyToClipboard(colorTextController.text),
      ),
      autofocus: true,
      maxLength: 9,
      inputFormatters: [
        // Any custom input formatter can be passed
        // here or use any Form validator you want.
        UpperCaseTextFormatter(),
        FilteringTextInputFormatter.allow(RegExp(kValidHexPattern)),
      ],
    );
  }
}
