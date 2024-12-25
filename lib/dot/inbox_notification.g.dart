// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbox_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InboxNotificationAction _$InboxNotificationActionFromJson(
        Map<String, dynamic> json) =>
    InboxNotificationAction(
      label: json['label'] as String,
      isCompleted: json['isCompleted'] as bool,
      redirect: json['redirect'] == null
          ? null
          : MessageCTAData.fromJson(json['redirect'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InboxNotificationActionToJson(
        InboxNotificationAction instance) =>
    <String, dynamic>{
      'label': instance.label,
      'isCompleted': instance.isCompleted,
      'redirect': instance.redirect,
    };

InboxNotification _$InboxNotificationFromJson(Map<String, dynamic> json) =>
    InboxNotification(
      id: json['id'] as String,
      body: json['body'] as String,
      to: json['to'] == null
          ? null
          : SubscriberFeedResponse.fromJson(json['to'] as Map<String, dynamic>),
      isRead: json['isRead'] as bool,
      isArchived: json['isArchived'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      channelType: $enumDecode(_$ChannelTypeEnumMap, json['channelType']),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      redirect: json['redirect'] == null
          ? null
          : MessageCTAData.fromJson(json['redirect'] as Map<String, dynamic>),
      subject: json['subject'] as String?,
      avatar: json['avatar'] as String?,
      primaryAction: json['primaryAction'] == null
          ? null
          : InboxNotificationAction.fromJson(
              json['primaryAction'] as Map<String, dynamic>),
      secondaryAction: json['secondaryAction'] == null
          ? null
          : InboxNotificationAction.fromJson(
              json['secondaryAction'] as Map<String, dynamic>),
      data: json['data'] as Map<String, dynamic>?,
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
      archivedAt: json['archivedAt'] == null
          ? null
          : DateTime.parse(json['archivedAt'] as String),
    );

Map<String, dynamic> _$InboxNotificationToJson(InboxNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'body': instance.body,
      'to': instance.to,
      'isRead': instance.isRead,
      'isArchived': instance.isArchived,
      'createdAt': instance.createdAt.toIso8601String(),
      'readAt': instance.readAt?.toIso8601String(),
      'archivedAt': instance.archivedAt?.toIso8601String(),
      'avatar': instance.avatar,
      'primaryAction': instance.primaryAction,
      'secondaryAction': instance.secondaryAction,
      'channelType': _$ChannelTypeEnumMap[instance.channelType]!,
      'tags': instance.tags,
      'data': instance.data,
      'redirect': instance.redirect,
    };

const _$ChannelTypeEnumMap = {
  ChannelType.inApp: 'in_app',
  ChannelType.email: 'email',
  ChannelType.sms: 'sms',
  ChannelType.chat: 'chat',
  ChannelType.push: 'push',
};

PreferenceOverride _$PreferenceOverrideFromJson(Map<String, dynamic> json) =>
    PreferenceOverride(
      channel: $enumDecode(_$ChannelTypeEnumMap, json['channel']),
      source: $enumDecode(_$PreferenceOverrideSourceEnumMap, json['source']),
    );

Map<String, dynamic> _$PreferenceOverrideToJson(PreferenceOverride instance) =>
    <String, dynamic>{
      'channel': _$ChannelTypeEnumMap[instance.channel]!,
      'source': _$PreferenceOverrideSourceEnumMap[instance.source]!,
    };

const _$PreferenceOverrideSourceEnumMap = {
  PreferenceOverrideSource.subscriber: 'subscriber',
  PreferenceOverrideSource.template: 'template',
  PreferenceOverrideSource.workflowOverride: 'workflowOverride',
};

PreferenceWorkflow _$PreferenceWorkflowFromJson(Map<String, dynamic> json) =>
    PreferenceWorkflow(
      id: json['id'] as String,
      identifier: json['identifier'] as String,
      name: json['name'] as String,
      critical: json['critical'] as bool,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PreferenceWorkflowToJson(PreferenceWorkflow instance) =>
    <String, dynamic>{
      'id': instance.id,
      'identifier': instance.identifier,
      'name': instance.name,
      'critical': instance.critical,
      'tags': instance.tags,
    };

PreferencesResponse _$PreferencesResponseFromJson(Map<String, dynamic> json) =>
    PreferencesResponse(
      level: $enumDecode(_$SubscriberPreferenceLevelEnumMap, json['level']),
      enabled: json['enabled'] as bool,
      channels:
          PreferenceChannel.fromJson(json['channels'] as Map<String, dynamic>),
      overrides: (json['overrides'] as List<dynamic>?)
          ?.map((e) => PreferenceOverride.fromJson(e as Map<String, dynamic>))
          .toList(),
      workflow: json['workflow'] == null
          ? null
          : PreferenceWorkflow.fromJson(
              json['workflow'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PreferencesResponseToJson(
        PreferencesResponse instance) =>
    <String, dynamic>{
      'level': _$SubscriberPreferenceLevelEnumMap[instance.level]!,
      'enabled': instance.enabled,
      'channels': instance.channels,
      'overrides': instance.overrides,
      'workflow': instance.workflow,
    };

const _$SubscriberPreferenceLevelEnumMap = {
  SubscriberPreferenceLevel.global: 'global',
  SubscriberPreferenceLevel.template: 'template',
};
