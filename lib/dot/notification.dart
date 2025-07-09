import 'package:flutter_novu/dot/message_template.dart';
import 'package:flutter_novu/dot/shared.dart';
import 'package:flutter_novu/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification {
  @JsonKey(name: '_id')
  late final String id;

  @JsonKey(name: '_templateId')
  late final String templateId;

  @JsonKey(name: '_environmentId')
  late final String environmentId;

  @JsonKey(name: '_organizationId')
  late final String organizationId;

  @JsonKey(name: '_notificationId')
  late final String notificationId;

  @JsonKey(name: '_subscriberId')
  late final String subscriberId;

  @JsonKey(name: '_messageTemplateId')
  late final String messageTemplateId;

  @JsonKey(name: '_feedId')
  final String? feedId;

  @JsonKey(name: '_jobId')
  late final String jobId;

  late final DateTime createdAt;

  late final DateTime? updatedAt;

  late final DateTime? lastSeenDate;

  late final DateTime? lastReadDate;

  final Actor? actor;

  final SubscriberFeedResponse? subscriber;

  late final String transactionId;

  final String? templateIdentifier;

  final String? providerId;

  late final String content;

  late final ChannelType channel;

  late final bool read;
  late final bool seen;
  final bool? archived;
  final String? subject;
  late final bool deleted;
  final List<String>? deviceTokens;

  final MessageCTA? cta;

  late final NotificationStatus status;
  final Map<String, dynamic>? payload;
  final Map<String, dynamic>? overrides;
  final List<String>? tags;

  Notification({
    required this.id,
    required this.templateId,
    required this.environmentId,
    required this.organizationId,
    required this.notificationId,
    required this.subscriberId,
    required this.messageTemplateId,
    required this.jobId,
    required this.createdAt,
    this.updatedAt,
    this.lastSeenDate,
    this.lastReadDate,
    this.actor,
    this.subscriber,
    required this.transactionId,
    this.feedId,
    this.templateIdentifier,
    this.providerId,
    required this.content,
    required this.channel,
    required this.read,
    required this.seen,
    this.subject,
    required this.deleted,
    this.deviceTokens,
    this.cta,
    required this.status,
    this.payload,
    this.overrides,
    this.archived,
    this.tags,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}