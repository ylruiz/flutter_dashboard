import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'drop_on_tile.dart';
import 'draggable_tile.dart';
import '../models/drag_data.dart';
import '../../config/app_constants.dart';

class DropZone extends StatelessWidget {
  const DropZone({
    super.key,
    required this.isLeft,
    required this.ids,
    required this.buildTile,
    required this.onMove,
  });

  final bool isLeft;
  final List<String> ids;
  final Widget Function(String id) buildTile;
  final void Function({
    required String id,
    required bool fromLeft,
    required int fromIndex,
    required bool toLeft,
    required int toIndex,
  })
  onMove;

  @override
  Widget build(BuildContext context) {
    // Empty column: allow dropping at index 0
    if (ids.isEmpty) {
      return DragTarget<DragData>(
        onWillAcceptWithDetails: (_) => true,
        onAcceptWithDetails: (details) {
          final d = details.data;
          onMove(
            id: d.id,
            fromLeft: d.fromLeft,
            fromIndex: d.fromIndex,
            toLeft: isLeft,
            toIndex: 0,
          );
        },
        builder: (context, candidate, rejected) {
          final active = candidate.isNotEmpty;
          return DottedBorder(
            options: RoundedRectDottedBorderOptions(
              dashPattern: [10, 5],
              strokeWidth: 2,
              radius: Radius.circular(16),
              color: Colors.indigo,
              padding: EdgeInsets.all(16),
            ),

            child: Container(
              height: 120,
              alignment: Alignment.center,
              child: Text(active ? 'Release to drop' : 'Drag here'),
            ),
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < ids.length; i++) ...[
          DropOnTile(
            index: i,
            isLeft: isLeft,
            onMove: onMove,
            child: DraggableTile(
              id: ids[i],
              index: i,
              isLeft: isLeft,
              child: buildTile(ids[i]),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
        ],

        // Drop after last item
        DragTarget<DragData>(
          onWillAcceptWithDetails: (_) => true,
          onAcceptWithDetails: (details) {
            final d = details.data;
            onMove(
              id: d.id,
              fromLeft: d.fromLeft,
              fromIndex: d.fromIndex,
              toLeft: isLeft,
              toIndex: ids.length,
            );
          },
          builder: (context, candidate, rejected) {
            final active = candidate.isNotEmpty;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 120),
              height: active ? 22 : 14,
              decoration: BoxDecoration(
                color: active
                    ? Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.18)
                    : Colors.transparent,
              ),
            );
          },
        ),
      ],
    );
  }
}
