// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailBlock _$EmailBlockFromJson(Map<String, dynamic> json) => EmailBlock(
      type: $enumDecode(_$EmailBlockTypeEnumMap, json['type']),
      content: json['content'] as String,
      url: json['url'] as String?,
      styles: json['styles'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$EmailBlockToJson(EmailBlock instance) =>
    <String, dynamic>{
      'type': _$EmailBlockTypeEnumMap[instance.type]!,
      'content': instance.content,
      'url': instance.url,
      'styles': instance.styles,
    };

const _$EmailBlockTypeEnumMap = {
  EmailBlockType.button: 'button',
  EmailBlockType.text: 'text',
};

TemplateVariable _$TemplateVariableFromJson(Map<String, dynamic> json) =>
    TemplateVariable(
      type: $enumDecode(_$TemplateVariableTypeEnumMap, json['type']),
      name: json['name'] as String,
      required: json['required'] as bool?,
      defaultValue: json['defaultValue'],
    );

Map<String, dynamic> _$TemplateVariableToJson(TemplateVariable instance) =>
    <String, dynamic>{
      'type': _$TemplateVariableTypeEnumMap[instance.type]!,
      'name': instance.name,
      'required': instance.required,
      'defaultValue': instance.defaultValue,
    };

const _$TemplateVariableTypeEnumMap = {
  TemplateVariableType.string: 'String',
  TemplateVariableType.array: 'Array',
  TemplateVariableType.boolean: 'Boolean',
};

MessageTemplateCTAData _$MessageTemplateCTADataFromJson(
        Map<String, dynamic> json) =>
    MessageTemplateCTAData(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$MessageTemplateCTADataToJson(
        MessageTemplateCTAData instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

MessageTemplateCTA _$MessageTemplateCTAFromJson(Map<String, dynamic> json) =>
    MessageTemplateCTA(
      type: $enumDecode(_$ChannelCTATypeEnumMap, json['type']),
      data:
          MessageTemplateCTAData.fromJson(json['data'] as Map<String, dynamic>),
      action: json['action'],
    );

Map<String, dynamic> _$MessageTemplateCTAToJson(MessageTemplateCTA instance) =>
    <String, dynamic>{
      'type': _$ChannelCTATypeEnumMap[instance.type]!,
      'data': instance.data,
      'action': instance.action,
    };

const _$ChannelCTATypeEnumMap = {
  ChannelCTAType.redirect: 'redirect',
};

MessageTemplate _$MessageTemplateFromJson(Map<String, dynamic> json) =>
    MessageTemplate(
      id: json['_id'] as String?,
      environmentId: json['_environmentId'] as String?,
      organizationId: json['_organizationId'] as String?,
      creatorId: json['_creatorId'] as String?,
      feedId: json['_feedId'] as String?,
      layoutId: json['_layoutId'] as String?,
      parentId: json['_parentId'] as String?,
      subject: json['subject'] as String?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      type: $enumDecode(_$StepTypeEnumMap, json['type']),
      contentType: $enumDecodeNullable(
          _$MessageTemplateContentTypeEnumMap, json['contentType']),
      content: json['content'],
      variables: (json['variables'] as List<dynamic>?)
          ?.map((e) => TemplateVariable.fromJson(e as Map<String, dynamic>))
          .toList(),
      cta: json['cta'] == null
          ? null
          : MessageTemplateCTA.fromJson(json['cta'] as Map<String, dynamic>),
      active: json['active'] as bool?,
      preheader: json['preheader'] as String?,
      senderName: json['senderName'] as String?,
      actor: json['actor'] == null
          ? null
          : Actor.fromJson(json['actor'] as Map<String, dynamic>),
      code: json['code'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MessageTemplateToJson(MessageTemplate instance) =>
    <String, dynamic>{
      '_id': instance.id,
      '_environmentId': instance.environmentId,
      '_organizationId': instance.organizationId,
      '_creatorId': instance.creatorId,
      '_feedId': instance.feedId,
      '_layoutId': instance.layoutId,
      '_parentId': instance.parentId,
      'subject': instance.subject,
      'name': instance.name,
      'title': instance.title,
      'type': _$StepTypeEnumMap[instance.type]!,
      'contentType': _$MessageTemplateContentTypeEnumMap[instance.contentType],
      'content': instance.content,
      'variables': instance.variables,
      'cta': instance.cta,
      'active': instance.active,
      'preheader': instance.preheader,
      'senderName': instance.senderName,
      'actor': instance.actor,
      'code': instance.code,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$StepTypeEnumMap = {
  StepType.inApp: 'in_app',
  StepType.email: 'email',
  StepType.sms: 'sms',
  StepType.chat: 'chat',
  StepType.push: 'push',
  StepType.digest: 'digest',
  StepType.trigger: 'trigger',
  StepType.delay: 'delay',
  StepType.custom: 'custom',
};

const _$MessageTemplateContentTypeEnumMap = {
  MessageTemplateContentType.editor: 'editor',
  MessageTemplateContentType.customHtml: 'customHtml',
};

MessageActionResult _$MessageActionResultFromJson(Map<String, dynamic> json) =>
    MessageActionResult(
      payload: json['payload'] as Map<String, dynamic>?,
      type: $enumDecodeNullable(_$ButtonTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$MessageActionResultToJson(
        MessageActionResult instance) =>
    <String, dynamic>{
      'payload': instance.payload,
      'type': _$ButtonTypeEnumMap[instance.type],
    };

const _$ButtonTypeEnumMap = {
  ButtonType.primary: 'primary',
  ButtonType.secondary: 'secondary',
};

MessageButton _$MessageButtonFromJson(Map<String, dynamic> json) =>
    MessageButton(
      type: $enumDecode(_$ButtonTypeEnumMap, json['type']),
      content: json['content'] as String,
      resultContent: json['resultContent'] as String?,
      url: json['url'] as String?,
      target: json['target'] as String?,
    );

Map<String, dynamic> _$MessageButtonToJson(MessageButton instance) =>
    <String, dynamic>{
      'type': _$ButtonTypeEnumMap[instance.type]!,
      'content': instance.content,
      'resultContent': instance.resultContent,
      'url': instance.url,
      'target': instance.target,
    };

MessageAction _$MessageActionFromJson(Map<String, dynamic> json) =>
    MessageAction(
      status: $enumDecodeNullable(_$MessageActionStatusEnumMap, json['status']),
      buttons: (json['buttons'] as List<dynamic>?)
          ?.map((e) => MessageButton.fromJson(e as Map<String, dynamic>))
          .toList(),
      result: json['result'] == null
          ? null
          : MessageActionResult.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageActionToJson(MessageAction instance) =>
    <String, dynamic>{
      'status': _$MessageActionStatusEnumMap[instance.status],
      'buttons': instance.buttons,
      'result': instance.result,
    };

const _$MessageActionStatusEnumMap = {
  MessageActionStatus.pending: 'pending',
  MessageActionStatus.done: 'done',
};

MessageCTAData _$MessageCTADataFromJson(Map<String, dynamic> json) =>
    MessageCTAData(
      url: json['url'] as String?,
      target: json['target'] as String?,
    );

Map<String, dynamic> _$MessageCTADataToJson(MessageCTAData instance) =>
    <String, dynamic>{
      'url': instance.url,
      'target': instance.target,
    };

MessageCTA _$MessageCTAFromJson(Map<String, dynamic> json) => MessageCTA(
      type: $enumDecode(_$ChannelCTATypeEnumMap, json['type']),
      data: MessageCTAData.fromJson(json['data'] as Map<String, dynamic>),
      action: json['action'] == null
          ? null
          : MessageAction.fromJson(json['action'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageCTAToJson(MessageCTA instance) =>
    <String, dynamic>{
      'type': _$ChannelCTATypeEnumMap[instance.type]!,
      'data': instance.data,
      'action': instance.action,
    };
