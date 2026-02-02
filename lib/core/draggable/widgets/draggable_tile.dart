import 'package:flutter/material.dart';
import '../models/drag_data.dart';

class DraggableTile extends StatelessWidget {
  const DraggableTile({
    super.key,
    required this.id,
    required this.index,
    required this.isLeft,
    required this.child,
  });

  final String id;
  final int index;
  final bool isLeft;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final data = DragData(id: id, fromLeft: isLeft, fromIndex: index);

    return Draggable<DragData>(
      data: data,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: Material(
        type: MaterialType.transparency,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Opacity(opacity: 0.92, child: child),
        ),
      ),
      childWhenDragging: Opacity(opacity: 0.35, child: child),
      child: child,
    );
  }
}
