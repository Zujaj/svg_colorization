import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:svg_colorization/providers/svg_data.dart';

/// An [SvgPicture] widget that renders the svg.
class SceneRenderer extends StatelessWidget {
  const SceneRenderer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Holds the updated [SVData] object.
    final svg = context.watch<SVGData>();

    return svg.code.isNotEmpty
        ? Center(child: SvgPicture.string(svg.code))
        : const Center(child: CircularProgressIndicator.adaptive());
  }
}
