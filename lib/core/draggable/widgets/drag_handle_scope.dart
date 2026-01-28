import 'package:flutter/material.dart';

class DragHandleScope extends InheritedWidget {
  const DragHandleScope({super.key, required super.child, required this.index});

  final int index;

  static int? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DragHandleScope>()?.index;
  }

  @override
  bool updateShouldNotify(covariant DragHandleScope oldWidget) =>
      oldWidget.index != index;
}
