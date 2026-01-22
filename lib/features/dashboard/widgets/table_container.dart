import 'package:flutter/material.dart';
import '../../../core/widgets/custom_card.dart';

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
    return CustomCard(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
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
                border: TableBorder.all(
                  color: Colors.grey.shade300,
                  width: 0.5,
                ),
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
          ),
        ],
      ),
    );
  }
}
