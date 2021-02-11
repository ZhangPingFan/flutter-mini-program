import 'package:flutter/material.dart' hide Page;
import 'package:flutter_mini_program/Page.dart';
import 'package:html/dom.dart' as dom;

/// Creates a line break from a template <table> tag.
class TableTag extends StatelessWidget {
  final Page page;
  final dom.Element element;
  final Map style;

  TableTag({this.page, this.element, this.style});

  @override
  Widget build(BuildContext context) {
    assert(element.localName == 'table',
        'Expected <table>, instead found $element');

    var body = element.children
        .firstWhere((el) => el.localName == 'tbody', orElse: () => null);
    List<TableRow> children;
    if (body != null) {
      children = body.children.map(_buildRow).toList();
    } else {
      children = [];
    }

    return new Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: children,
        border: TableBorder.all(width: 1.0, color: Colors.grey));
  }

  /// Builds a table row from  a <tr> tag.
  TableRow _buildRow(dom.Element row) {
    assert(row.localName == 'tr', 'Expected <tr>, instead found $row');
    return new TableRow(children: row.children.map(_buildCell).toList());
  }

  /// Builds a table cell from a <td> tag.
  TableCell _buildCell(dom.Element cell) {
    assert(cell.localName == 'td' || cell.localName == 'th',
        'Expected <td> or <th>, instead found $cell');
    return new TableCell(
        child: new Container(
            padding: EdgeInsets.all(5),
            child: new Text(cell.text,
                style: TextStyle(
                    fontWeight: cell.localName == 'th'
                        ? FontWeight.bold
                        : FontWeight.normal))));
  }
}
