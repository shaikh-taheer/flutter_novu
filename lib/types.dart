import 'dart:ui';

import 'enums.dart';

class NovuActionOption {
  final dynamic icon;
  final Function()? onPress;
  final String? text;
  final Color? color;
  final dynamic result;
  final String? key;
  final List<NovuActionOption>? children;
  final String? badge;
  final IconPosition iconPosition;

  NovuActionOption(
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
class InboxTab {
  final String label;

  final NotificationFilterTags? filter;

  InboxTab({
    required this.label,
    this.filter,
  });
}

class NotificationFilterTags {
  final List<String> tags;

  NotificationFilterTags({
    required this.tags,
  });
}

class PreferencesFilter {
  final List<String> tags;

  const PreferencesFilter({required this.tags});
}