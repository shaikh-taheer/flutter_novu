import 'package:flutter_novu/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shared.g.dart';

@JsonSerializable()
class PreferenceChannel {
  final bool? email;

  final bool? sms;

  @JsonKey(name: 'in_app')
  final bool? inApp;

  final bool? chat;

  final bool? push;

  PreferenceChannel({
    this.email,
    this.sms,
    this.inApp,
    this.chat,
    this.push,
  });

  factory PreferenceChannel.fromJson(Map<String, dynamic> json) => _$PreferenceChannelFromJson(json);

  Map<String, dynamic> toJson() => _$PreferenceChannelToJson(this);
}

class PaginatedResponse<T> {
  final int page;
  final int totalCount;
  final int pageSize;
  final bool hasMore;
  final List<T> data;

  PaginatedResponse({
    required this.page,
    required this.totalCount,
    required this.pageSize,
    required this.hasMore,
    required this.data,
  });
}

@JsonSerializable()
class Actor {
  late final ActorType type;

  final String? data;

  Actor({required this.type, this.data});

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);

  Map<String, dynamic> toJson() => _$ActorToJson(this);
}

@JsonSerializable()
class ReplyCallback {
  final String? url;

  final bool? active;

  ReplyCallback({this.url, this.active});

  factory ReplyCallback.fromJson(Map<String, dynamic> json) => _$ReplyCallbackFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyCallbackToJson(this);
}

@JsonSerializable()
class SubscriberFeedResponse {
  late final String id;

  final String? firstName;

  final String? lastName;

  final String? avatar;

  late final String? subscriberId;

  SubscriberFeedResponse({
    required this.id,
    this.firstName,
    this.lastName,
    this.avatar,
    required this.subscriberId,
  });

  factory SubscriberFeedResponse.fromJson(Map<String, dynamic> json) => _$SubscriberFeedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriberFeedResponseToJson(this);
}