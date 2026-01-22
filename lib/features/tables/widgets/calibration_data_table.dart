import 'package:flutter/material.dart';
import '../../dashboard/widgets/table_container.dart';

class CalibrationDataTable extends StatelessWidget {
  const CalibrationDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return const TableContainer(
      title: 'Calibration Data',
      headers: ['Channel', 'Offset', 'Scale', 'Last Cal', 'Technician'],
      rows: [
        ['CH1', '+0.02mV', '1.001', '2024-01-15', 'J. Smith'],
        ['CH2', '-0.01mV', '0.999', '2024-01-15', 'J. Smith'],
        ['CH3', '+0.05mV', '1.002', '2024-01-10', 'M. Johnson'],
        ['CH4', '-0.03mV', '0.998', '2024-01-10', 'M. Johnson'],
        ['REF', '0.00mV', '1.000', '2024-01-05', 'R. Williams'],
        ['AUX', '+0.01mV', '1.001', '2024-01-05', 'R. Williams'],
      ],
    );
  }
}
