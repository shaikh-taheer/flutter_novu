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

class NotificationFilter {
  List<String>? tags;
  bool? read;
  bool? archived;

  NotificationFilter({this.tags, this.read, this.archived});
}

/// The Tab type
class Tab {
  final String label;

  /// @deprecated Use `filter` instead
  final List<String>? value;
  final NotificationFilterTags? filter;

  Tab({
    required this.label,
    this.value,
    this.filter,
  });
}

/// Pick<NotificationFilter, 'tags'>
class NotificationFilterTags {
  final List<String> tags;

  NotificationFilterTags({
    required this.tags,
  });
}