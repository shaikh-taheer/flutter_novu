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