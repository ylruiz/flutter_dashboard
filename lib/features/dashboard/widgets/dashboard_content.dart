import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/config/app_constants.dart';
import '../../../core/config/responsive.dart';
import '../../../core/draggable/widgets/drag_handle_scope.dart';
import '../../tables/widgets/component_specs_table.dart';
import '../../tables/widgets/sensor_table.dart';
import '../../../core/draggable/widgets/drop_zone.dart';
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

class _DesktopDashboardContent extends HookWidget {
  const _DesktopDashboardContent();

  @override
  Widget build(BuildContext context) {
    // Hard-coded initial layout (left column has graph + sensor, right has specs)
    final left = useState<List<String>>(['graph', 'sensor']);
    final right = useState<List<String>>(['specs']);

    final leftController = useScrollController();
    final rightController = useScrollController();

    Widget buildTile(String id) {
      switch (id) {
        case 'graph':
          return const GraphContainer(key: ValueKey('graph'));
        case 'sensor':
          return const SensorTable(key: ValueKey('sensor'));
        case 'specs':
          return const ComponentSpecsTable(key: ValueKey('specs'));
        default:
          return const SizedBox.shrink();
      }
    }

    void move({
      required String id,
      required bool fromLeft,
      required int fromIndex,
      required bool toLeft,
      required int toIndex,
    }) {
      final fromList = List<String>.of(fromLeft ? left.value : right.value);
      final toList = List<String>.of(toLeft ? left.value : right.value);

      // remove from source
      fromList.removeAt(fromIndex);

      // if moving within same list, index may shift
      var insertIndex = toIndex;
      if (fromLeft == toLeft && fromIndex < toIndex) {
        insertIndex -= 1;
      }

      insertIndex = insertIndex.clamp(0, toList.length);

      // if same column, we're inserting into the already-removed list
      final target = (fromLeft == toLeft) ? fromList : toList;
      target.insert(insertIndex, id);

      // commit
      if (fromLeft) {
        left.value = (fromLeft == toLeft) ? target : fromList;
      } else {
        right.value = (fromLeft == toLeft) ? target : fromList;
      }

      if (toLeft && fromLeft != toLeft) left.value = target;
      if (!toLeft && fromLeft != toLeft) right.value = target;
    }

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: constraints
                .maxHeight, // important: gives scroll views a bounded height
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: leftController,
                    child: DropZone(
                      isLeft: true,
                      ids: left.value,
                      buildTile: buildTile,
                      onMove: move,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.lg),
                Expanded(
                  child: SingleChildScrollView(
                    controller: rightController,
                    child: DropZone(
                      isLeft: false,
                      ids: right.value,
                      buildTile: buildTile,
                      onMove: move,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
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
