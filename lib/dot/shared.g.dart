// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreferenceChannel _$PreferenceChannelFromJson(Map<String, dynamic> json) =>
    PreferenceChannel(
      email: json['email'] as bool?,
      sms: json['sms'] as bool?,
      inApp: json['in_app'] as bool?,
      chat: json['chat'] as bool?,
      push: json['push'] as bool?,
    );

Map<String, dynamic> _$PreferenceChannelToJson(PreferenceChannel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'sms': instance.sms,
      'in_app': instance.inApp,
      'chat': instance.chat,
      'push': instance.push,
    };

Actor _$ActorFromJson(Map<String, dynamic> json) => Actor(
      type: $enumDecode(_$ActorTypeEnumMap, json['type']),
      data: json['data'] as String?,
    );

Map<String, dynamic> _$ActorToJson(Actor instance) => <String, dynamic>{
      'type': _$ActorTypeEnumMap[instance.type]!,
      'data': instance.data,
    };

const _$ActorTypeEnumMap = {
  ActorType.none: 'none',
  ActorType.user: 'user',
  ActorType.systemIcon: 'system_icon',
  ActorType.systemCustom: 'system_custom',
};

ReplyCallback _$ReplyCallbackFromJson(Map<String, dynamic> json) =>
    ReplyCallback(
      url: json['url'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$ReplyCallbackToJson(ReplyCallback instance) =>
    <String, dynamic>{
      'url': instance.url,
      'active': instance.active,
    };

SubscriberFeedResponse _$SubscriberFeedResponseFromJson(
        Map<String, dynamic> json) =>
    SubscriberFeedResponse(
      id: json['_id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      avatar: json['avatar'] as String?,
      subscriberId: json['subscriberId'] as String?,
    );

Map<String, dynamic> _$SubscriberFeedResponseToJson(
        SubscriberFeedResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'avatar': instance.avatar,
      'subscriberId': instance.subscriberId,
    };
