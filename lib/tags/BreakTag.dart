import 'package:flutter/material.dart' hide Page;
import 'package:flutter_mini_program/Page.dart';
import 'package:html/dom.dart' as dom;

/// Creates a line break from a template <br/> tag.
class BreakTag extends StatelessWidget {
  final Page page;
  final dom.Element element;
  final Map style;

  BreakTag({this.page, this.element, this.style});

  @override
  Widget build(BuildContext context) {
    assert(element.localName == 'br');
    return new Container(height: 8.0);
  }
}
