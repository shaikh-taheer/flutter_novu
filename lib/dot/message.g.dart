// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['_id'] as String,
      templateId: json['_templateId'] as String,
      environmentId: json['_environmentId'] as String,
      organizationId: json['_organizationId'] as String,
      notificationId: json['_notificationId'] as String,
      subscriberId: json['_subscriberId'] as String,
      template: json['template'] == null
          ? null
          : NotificationTemplate.fromJson(
              json['template'] as Map<String, dynamic>),
      templateIdentifier: json['templateIdentifier'] as String?,
      content: json['content'],
      channel: $enumDecode(_$ChannelTypeEnumMap, json['channel']),
      seen: json['seen'] as bool,
      read: json['read'] as bool,
      lastSeenDate: json['lastSeenDate'] == null
          ? null
          : DateTime.parse(json['lastSeenDate'] as String),
      lastReadDate: json['lastReadDate'] == null
          ? null
          : DateTime.parse(json['lastReadDate'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      cta: json['cta'] == null
          ? null
          : MessageCTA.fromJson(json['cta'] as Map<String, dynamic>),
      feedId: json['_feedId'] as String?,
      layoutId: json['_layoutId'] as String?,
      payload: json['payload'] as Map<String, dynamic>?,
      data: json['data'] as Map<String, dynamic>?,
      actor: json['actor'] == null
          ? null
          : Actor.fromJson(json['actor'] as Map<String, dynamic>),
      avatar: json['avatar'] as String?,
      subject: json['subject'] as String?,
      transactionId: json['transactionId'] as String,
      providerId: json['providerId'] as String?,
      deviceTokens: (json['deviceTokens'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: $enumDecode(_$NotificationStatusEnumMap, json['status']),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      archived: json['archived'] as bool? ?? false,
      delete: json['delete'] as bool? ?? false,
      messageTemplateId: json['_messageTemplateId'] as String?,
      jobId: json['_jobId'] as String?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      '_id': instance.id,
      '_templateId': instance.templateId,
      '_environmentId': instance.environmentId,
      '_messageTemplateId': instance.messageTemplateId,
      '_organizationId': instance.organizationId,
      '_notificationId': instance.notificationId,
      '_subscriberId': instance.subscriberId,
      '_jobId': instance.jobId,
      'template': instance.template,
      'templateIdentifier': instance.templateIdentifier,
      'content': instance.content,
      'channel': _$ChannelTypeEnumMap[instance.channel]!,
      'providerId': instance.providerId,
      'deviceTokens': instance.deviceTokens,
      'seen': instance.seen,
      'read': instance.read,
      'archived': instance.archived,
      'delete': instance.delete,
      'lastSeenDate': instance.lastSeenDate?.toIso8601String(),
      'lastReadDate': instance.lastReadDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'cta': instance.cta,
      '_feedId': instance.feedId,
      '_layoutId': instance.layoutId,
      'status': _$NotificationStatusEnumMap[instance.status]!,
      'payload': instance.payload,
      'data': instance.data,
      'actor': instance.actor,
      'avatar': instance.avatar,
      'subject': instance.subject,
      'transactionId': instance.transactionId,
      'tags': instance.tags,
    };

const _$ChannelTypeEnumMap = {
  ChannelType.inApp: 'in_app',
  ChannelType.email: 'email',
  ChannelType.sms: 'sms',
  ChannelType.chat: 'chat',
  ChannelType.push: 'push',
};

const _$NotificationStatusEnumMap = {
  NotificationStatus.sent: 'sent',
  NotificationStatus.error: 'error',
  NotificationStatus.warning: 'warning',
};
