import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/widgets/dashboard_layout.dart';

@RoutePage()
class GraphicsScreen extends StatelessWidget {
  const GraphicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveDashboardLayout(
      body: Text('Graphics Screen goes here'),
    );
  }
}
