import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/config/app_constants.dart';
import '../../../core/config/responsive.dart';
import '../../../core/draggable/widgets/drag_handle_scope.dart';
import '../../tables/widgets/component_specs_table.dart';
import '../../tables/widgets/sensor_table.dart';
import 'graph_container.dart';

class ResponsiveDashboardContent extends StatelessWidget {
  const ResponsiveDashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context) || Responsive.isTablet(context)) {
      return const _DesktopDashboardContent();
    }

    return const _MobileDashboardContent();
  }
}

class _DesktopDashboardContent extends StatelessWidget {
  const _DesktopDashboardContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: AppSpacing.lg,
      children: const [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSpacing.lg,
            children: [GraphContainer(), SensorTable()],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSpacing.lg,
            children: [ComponentSpecsTable()],
          ),
        ),
      ],
    );
  }
}

class _MobileDashboardContent extends HookWidget {
  const _MobileDashboardContent();

  @override
  Widget build(BuildContext context) {
    final items = useMemoized<List<Widget>>(
      () => const [
        GraphContainer(key: ValueKey('graph')),
        SensorTable(key: ValueKey('sensor')),
        ComponentSpecsTable(key: ValueKey('specs')),
      ],
    );

    final state = useState<List<Widget>>(items);

    void onReorder(int oldIndex, int newIndex) {
      final list = List<Widget>.of(state.value);
      if (newIndex > oldIndex) newIndex -= 1;
      final moved = list.removeAt(oldIndex);
      list.insert(newIndex, moved);
      state.value = list;
    }

    return ReorderableListView.builder(
      padding: const EdgeInsets.all(AppSpacing.lg),
      buildDefaultDragHandles: false,
      onReorder: onReorder,
      proxyDecorator: (child, index, animation) {
        return Material(type: MaterialType.transparency, child: child);
      },
      itemCount: state.value.length,
      itemBuilder: (context, index) {
        final item = state.value[index];

        return Padding(
          key: item.key!,
          padding: const EdgeInsets.only(bottom: AppSpacing.lg),
          child: DragHandleScope(index: index, child: item),
        );
      },
    );
  }
}
