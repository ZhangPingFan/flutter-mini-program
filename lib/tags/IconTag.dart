import 'package:flutter/material.dart' hide Page;
import 'package:flutter_mini_program/Page.dart';
import 'package:flutter_mini_program/utils/ResourceUtil.dart';
import 'package:html/dom.dart' as dom;

/// Builds a icon from a <icon> tag.
class IconTag extends StatelessWidget {
  final Page page;
  final dom.Element element;
  final Map style;

  IconTag({this.page, this.element, this.style});

  @override
  Widget build(BuildContext context) {
    assert(element.localName == 'icon');
    String type = this.element.attributes['type'];
    IconData iconData = ResourceUtil.queryIconsMap()[type];
    double iconSize = double.parse(this.element.attributes['size']);
    return new Icon(iconData, size: iconSize);
  }
}
