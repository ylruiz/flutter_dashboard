import 'package:flutter/material.dart';
import '../../../core/widgets/expanded_container.dart';

class TableContainer extends StatelessWidget {
  final String title;
  final List<String> headers;
  final List<List<String>> rows;

  const TableContainer({
    super.key,
    required this.title,
    required this.headers,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandedContainer(
      title: title,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columnSpacing: 12,
          horizontalMargin: 0,
          dataRowMinHeight: 40,
          dataRowMaxHeight: 40,
          headingRowHeight: 36,
          dividerThickness: 1,
          headingRowColor: WidgetStateProperty.resolveWith(
            (states) => Colors.grey.shade100,
          ),
          border: TableBorder.all(color: Colors.grey.shade300, width: 0.5),
          columns: headers.map((header) {
            return DataColumn(
              label: Expanded(
                child: Text(
                  header,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            );
          }).toList(),
          rows: rows.map((row) {
            return DataRow(
              cells: row.map((cell) {
                return DataCell(
                  Text(cell, style: const TextStyle(fontSize: 11)),
                );
              }).toList(),
            );
          }).toList(),
        ),
      ),
    );
  }
}
