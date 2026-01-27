import 'package:flutter/material.dart';

import '../../tables/widgets/component_specs_table.dart';
import '../../tables/widgets/sensor_table.dart';
import 'graph_container.dart';

class ResponsiveDashboardContent extends StatelessWidget {
  const ResponsiveDashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (context, index) => const SizedBox(height: 16.0),
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return GraphContainer();
          case 1:
            return SensorTable();
          case 2:
            return ComponentSpecsTable();
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
