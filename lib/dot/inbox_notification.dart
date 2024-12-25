import 'package:flutter_novu/dot/message_template.dart';
import 'package:flutter_novu/dot/shared.dart';
import 'package:flutter_novu/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inbox_notification.g.dart';

@JsonSerializable()
class InboxNotificationAction {
  late final String label;

  late final bool isCompleted;

  final MessageCTAData? redirect;

  InboxNotificationAction({required this.label, required this.isCompleted, this.redirect});

  factory InboxNotificationAction.fromJson(Map<String, dynamic> json) => _$InboxNotificationActionFromJson(json);

  Map<String, dynamic> toJson() => _$InboxNotificationActionToJson(this);
}

@JsonSerializable()
class InboxNotification {
  late final String id;

  final String? subject;

  late final String body;

  final SubscriberFeedResponse? to;

  late final bool isRead;

  late final bool isArchived;

  late final DateTime createdAt;

  final DateTime? readAt;

  final DateTime? archivedAt;

  final String? avatar;

  final InboxNotificationAction? primaryAction;

  final InboxNotificationAction? secondaryAction;

  late final ChannelType channelType;

  final List<String>? tags;

  final Map<String, dynamic>? data;

  final MessageCTAData? redirect;

  InboxNotification({
    required this.id,
    required this.body,
    this.to,
    required this.isRead,
    required this.isArchived,
    required this.createdAt,
    required this.channelType,
    this.tags,
    this.redirect,
    this.subject,
    this.avatar,
    this.primaryAction,
    this.secondaryAction,
    this.data,
    this.readAt,
    this.archivedAt,
  });

  factory InboxNotification.fromJson(Map<String, dynamic> json) => _$InboxNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$InboxNotificationToJson(this);
}

@JsonSerializable()
class PreferenceOverride {
  late final ChannelType channel;
  late final PreferenceOverrideSource source;

  PreferenceOverride({required this.channel, required this.source});

  factory PreferenceOverride.fromJson(Map<String, dynamic> json) => _$PreferenceOverrideFromJson(json);

  Map<String, dynamic> toJson() => _$PreferenceOverrideToJson(this);
}

@JsonSerializable()
class PreferenceWorkflow {
  late final String id;
  late final String identifier;
  late final String name;
  late final bool critical;
  final List<String>? tags;

  PreferenceWorkflow({
    required this.id,
    required this.identifier,
    required this.name,
    required this.critical,
    this.tags,
  });

  factory PreferenceWorkflow.fromJson(Map<String, dynamic> json) => _$PreferenceWorkflowFromJson(json);

  Map<String, dynamic> toJson() => _$PreferenceWorkflowToJson(this);
}

@JsonSerializable()
class PreferencesResponse {
  late final SubscriberPreferenceLevel level;
  late final bool enabled;
  late final PreferenceChannel channels;
  late final List<PreferenceOverride>? overrides;
  final PreferenceWorkflow? workflow;

  PreferencesResponse({
    required this.level,
    required this.enabled,
    required this.channels,
    this.overrides,
    this.workflow,
  });

  factory PreferencesResponse.fromJson(Map<String, dynamic> json) => _$PreferencesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PreferencesResponseToJson(this);
}