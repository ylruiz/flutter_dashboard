import 'package:flutter/material.dart';

import '../../tables/widgets/component_specs_table.dart';
import '../../tables/widgets/sensor_table.dart';
import 'graph_container.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
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
