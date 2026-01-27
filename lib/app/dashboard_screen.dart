import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/widgets/dashboard_layout.dart';
import '../features/dashboard/widgets/dashboard_content.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveDashboardLayout(body: ResponsiveDashboardContent());
  }
}
