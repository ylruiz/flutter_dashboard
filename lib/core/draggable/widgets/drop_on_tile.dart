import 'package:flutter/material.dart';
import '../models/drag_data.dart';

class DropOnTile extends StatelessWidget {
  const DropOnTile({
    super.key,
    required this.index,
    required this.isLeft,
    required this.child,
    required this.onMove,
  });

  final int index;
  final bool isLeft;
  final Widget child;

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
    return DragTarget<DragData>(
      onWillAcceptWithDetails: (_) => true,
      onAcceptWithDetails: (details) {
        final d = details.data;

        // Decide before/after based on drop position within this tile
        final box = context.findRenderObject() as RenderBox;
        final local = box.globalToLocal(details.offset);
        final insertAt = local.dy < box.size.height / 2 ? index : index + 1;

        onMove(
          id: d.id,
          fromLeft: d.fromLeft,
          fromIndex: d.fromIndex,
          toLeft: isLeft,
          toIndex: insertAt,
        );
      },
      builder: (context, candidate, rejected) {
        final active = candidate.isNotEmpty;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: active
                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.12)
                : Colors.transparent,
          ),
          child: child,
        );
      },
    );
  }
}
