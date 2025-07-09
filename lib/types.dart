import 'dart:ui';

import 'enums.dart';

class ActionOption {
  final dynamic icon;
  final Function()? onPress;
  final String? text;
  final Color? color;
  final dynamic result;
  final String? key;
  final List<ActionOption>? children;
  final String? badge;
  final IconPosition iconPosition;

  ActionOption(
      {this.icon, this.onPress, this.text, this.color, this.result, this.key, this.children, this.badge, this.iconPosition = IconPosition.left}) {
    assert(icon != null || text != null, 'You must set text or icon or both');
  }
}