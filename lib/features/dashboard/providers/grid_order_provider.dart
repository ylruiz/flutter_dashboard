import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grid_order_provider.g.dart';

@riverpod
class GridOrder extends _$GridOrder {
  @override
  List<String> build() {
    return [
      'graph',
      'table_sensor',
      'table_test',
      'table_components',
      'table_calibration',
      'map',
    ];
  }
}
