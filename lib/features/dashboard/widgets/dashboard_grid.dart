import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_reorderable_grid_view/widgets/widgets.dart';
import '../../../../core/config/responsive.dart';
import '../providers/grid_order_provider.dart';
import 'graph_container.dart';
import 'map_container.dart';
import '../../tables/widgets/sensor_table.dart';
import '../../tables/widgets/test_results_table.dart';
import '../../tables/widgets/component_specs_table.dart';
import '../../tables/widgets/calibration_data_table.dart';

class DashboardGrid extends ConsumerWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gridOrder = ref.watch(gridOrderProvider);
    final scrollController = ScrollController();

    final containerMap = {
      'graph': const GraphContainer(),
      'table_sensor': const SensorTable(),
      'table_test': const TestResultsTable(),
      'table_components': const ComponentSpecsTable(),
      'table_calibration': const CalibrationDataTable(),
      'map': const MapContainer(),
    };

    final crossAxisCount = Responsive.isMobile(context) ? 1 : 2;
    final childAspectRatio = Responsive.isMobile(context) ? 1.2 : 0.9;

    void handleReorder(ReorderedListFunction reorderedListFunction) {
      final newOrder = reorderedListFunction(gridOrder);
      final gridOrderNotifier = ref.read(gridOrderProvider.notifier);
      // Cast to dynamic to bypass Riverpod's protected 'state' access; consider
      // adding a public method on your notifier (e.g. setOrder) and calling that instead.
      (gridOrderNotifier as dynamic).state = List<String>.from(
        newOrder as Iterable,
      );
    }

    final children = gridOrder.map((id) {
      return Container(
        key: ValueKey(id),
        child: containerMap[id] ?? const SizedBox.shrink(),
      );
    }).toList();

    return ReorderableBuilder(
      onReorder: handleReorder,
      scrollController: scrollController,
      builder: (children) {
        return GridView.count(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          padding: const EdgeInsets.all(8),
          controller: scrollController,
          children: children,
        );
      },
      children: children,
    );
  }
}
