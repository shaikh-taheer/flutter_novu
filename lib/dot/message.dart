import 'package:flutter_novu/dot/message_template.dart';
import 'package:flutter_novu/dot/notification_template.dart';
import 'package:flutter_novu/dot/shared.dart';
import 'package:flutter_novu/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  @JsonKey(name: '_id')
  late final String id;

  @JsonKey(name: '_templateId')
  late final String templateId;

  @JsonKey(name: '_environmentId')
  late final String environmentId;

  @JsonKey(name: '_messageTemplateId')
  final String? messageTemplateId;

  @JsonKey(name: '_organizationId')
  late final String organizationId;

  @JsonKey(name: '_notificationId')
  late final String notificationId;

  @JsonKey(name: '_subscriberId')
  late final String subscriberId;

  @JsonKey(name: '_jobId')
  final String? jobId;

  final NotificationTemplate? template;

  final String? templateIdentifier;

  /// The content of the message template it can be a string or a list of blocks [IEmailBlock]
  final dynamic content;

  late final ChannelType channel;

  final String? providerId;

  final List<String>? deviceTokens;

  late final bool seen;
  late final bool read;
  late final bool archived;
  late final bool delete;
  late final DateTime? lastSeenDate;
  late final DateTime? lastReadDate;
  late final DateTime? createdAt;
  late final DateTime? updatedAt;

  final MessageCTA? cta;

  @JsonKey(name: '_feedId')
  final String? feedId;

  @JsonKey(name: '_layoutId')
  final String? layoutId;

  late final NotificationStatus status;

  final Map<String, dynamic>? payload;

  final Map<String, dynamic>? data;

  final Actor? actor;

  final String? avatar;

  final String? subject;

  late final String transactionId;

  final List<String>? tags;

  Message({
    required this.id,
    required this.templateId,
    required this.environmentId,
    required this.organizationId,
    required this.notificationId,
    required this.subscriberId,
    this.template,
    this.templateIdentifier,
    required this.content,
    required this.channel,
    required this.seen,
    required this.read,
    this.lastSeenDate,
    this.lastReadDate,
    this.createdAt,
    this.cta,
    this.feedId,
    this.layoutId,
    required this.payload,
    required this.data,
    this.actor,
    this.avatar,
    this.subject,
    required this.transactionId,
    this.providerId,
    this.deviceTokens,
    required this.status,
    this.updatedAt,
    this.tags,
    this.archived = false,
    this.delete = false,
    this.messageTemplateId,
    this.jobId,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}