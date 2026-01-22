import 'package:flutter/material.dart';
import '../../dashboard/widgets/table_container.dart';

class ComponentSpecsTable extends StatelessWidget {
  const ComponentSpecsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return const TableContainer(
      title: 'Component Specifications',
      headers: ['Part #', 'Component', 'Rating', 'Tolerance', 'Manufacturer'],
      rows: [
        ['R-1001', 'Resistor', '10kΩ', '1%', 'Vishay'],
        ['C-2001', 'Capacitor', '100nF', '10%', 'Murata'],
        ['U-3001', 'Op-Amp', '±18V', 'N/A', 'TI'],
        ['L-4001', 'Inductor', '10mH', '5%', 'Wurth'],
        ['D-5001', 'Diode', '100V', 'N/A', 'ON Semi'],
        ['Q-6001', 'Transistor', '60V/0.5A', 'N/A', 'Infineon'],
      ],
    );
  }
}
