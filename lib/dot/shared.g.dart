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
