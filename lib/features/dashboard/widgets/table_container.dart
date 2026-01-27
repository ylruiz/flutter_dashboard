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
      child: LayoutBuilder(
        builder: (context, constrains) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constrains.maxWidth),
              child: DataTable(
                columns: headers.map((header) {
                  return DataColumn(
                    label: Text(
                      header,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
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
        },
      ),
    );
  }
}
