import 'package:csslib/visitor.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class NoStyleFactory extends WidgetFactory {
  @override
  void parseStyle(
    BuildTree tree,
    Declaration declaration,
  ) {
    // Ignore all HTML styles
  }
}