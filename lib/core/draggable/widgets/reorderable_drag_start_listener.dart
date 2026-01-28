import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../config/responsive.dart';

class ResponsiveReorderableDragStartListener extends StatelessWidget {
  const ResponsiveReorderableDragStartListener({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context) || Responsive.isTablet(context)) {
      return SizedBox.shrink();
    }

    return ReorderableDragStartListener(
      index: index,
      child: IconButton(
        onPressed: null,
        icon: Icon(PhosphorIconsRegular.arrowsOutCardinal),
        tooltip: 'Drag to reorder',
      ),
    );
  }
}
