import 'package:flutter/material.dart';
import '../../dashboard/widgets/table_container.dart';

class SensorTable extends StatelessWidget {
  const SensorTable({super.key});

  @override
  Widget build(BuildContext context) {
    return const TableContainer(
      title: 'Sensor Readings',
      headers: ['Sensor', 'Value', 'Unit', 'Status'],
      rows: [
        ['Temp Sensor A', '23.5', '°C', 'OK'],
        ['Voltage In', '12.3', 'V', 'OK'],
        ['Current Out', '2.1', 'A', 'OK'],
        ['Pressure', '101.3', 'kPa', 'OK'],
        ['Humidity', '45', '%', 'Warning'],
        ['Light Level', '850', 'lux', 'OK'],
      ],
    );
  }
}
