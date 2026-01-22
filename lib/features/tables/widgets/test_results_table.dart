import 'package:flutter/material.dart';
import '../../dashboard/widgets/table_container.dart';

class TestResultsTable extends StatelessWidget {
  const TestResultsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return const TableContainer(
      title: 'Test Results',
      headers: ['Test ID', 'Result', 'Measured', 'Spec', 'Pass/Fail'],
      rows: [
        ['TC-001', 'Voltage', '5.02V', '5.0V±5%', 'Pass'],
        ['TC-002', 'Current', '210mA', '200mA±10%', 'Pass'],
        ['TC-003', 'Freq', '99.8kHz', '100kHz±2%', 'Pass'],
        ['TC-004', 'Noise', '12µV', '<20µV', 'Pass'],
        ['TC-005', 'Rise Time', '45ns', '<50ns', 'Pass'],
        ['TC-006', 'Power', '1.2W', '<2W', 'Pass'],
      ],
    );
  }
}
