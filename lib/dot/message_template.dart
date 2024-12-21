import 'package:flutter_novu/dot/shared.dart';
import 'package:flutter_novu/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_template.g.dart';

@JsonSerializable()
class EmailBlock {
  late final EmailBlockType type;

  late final String content;

  final String? url;

  final Map<String, dynamic>? styles;

  EmailBlock({
    required this.type,
    required this.content,
    this.url,
    this.styles,
  });

  factory EmailBlock.fromJson(Map<String, dynamic> json) => _$EmailBlockFromJson(json);

  Map<String, dynamic> toJson() => _$EmailBlockToJson(this);
}

@JsonSerializable()
class TemplateVariable {
  late final TemplateVariableType type;

  late final String name;

  final bool? required;

  final dynamic defaultValue;

  TemplateVariable({
    required this.type,
    required this.name,
    this.required,
    this.defaultValue,
  });

  factory TemplateVariable.fromJson(Map<String, dynamic> json) => _$TemplateVariableFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateVariableToJson(this);
}

@JsonSerializable()
class MessageTemplateCTAData {
  final String? url;

  MessageTemplateCTAData({this.url});

  factory MessageTemplateCTAData.fromJson(Map<String, dynamic> json) => _$MessageTemplateCTADataFromJson(json);

  Map<String, dynamic> toJson() => _$MessageTemplateCTADataToJson(this);
}

@JsonSerializable()
class MessageTemplateCTA {
  late final ChannelCTAType type;

  late final MessageTemplateCTAData data;

  final dynamic action;

  MessageTemplateCTA({required this.type, required this.data, this.action});

  factory MessageTemplateCTA.fromJson(Map<String, dynamic> json) => _$MessageTemplateCTAFromJson(json);

  Map<String, dynamic> toJson() => _$MessageTemplateCTAToJson(this);
}

@JsonSerializable()
class MessageTemplate {
  @JsonKey(name: '_id')
  final String? id;

  @JsonKey(name: '_environmentId')
  final String? environmentId;

  @JsonKey(name: '_organizationId')
  final String? organizationId;

  @JsonKey(name: '_creatorId')
  final String? creatorId;

  @JsonKey(name: '_feedId')
  final String? feedId;

  @JsonKey(name: '_layoutId')
  final String? layoutId;

  @JsonKey(name: '_parentId')
  final String? parentId;

  final String? subject;

  final String? name;

  final String? title;

  late final StepType type;

  final MessageTemplateContentType? contentType;

  /// The content of the message template it can be a string or a list of blocks [IEmailBlock]
  final dynamic content;

  final List<TemplateVariable>? variables;

  final MessageTemplateCTA? cta;

  final bool? active;

  final String? preheader;

  final String? senderName;

  final Actor? actor;

  // controls?: ControlSchemas;
  // output?: {
  // schema: JSONSchemaDto;
  // };

  final String? code;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  MessageTemplate({
    this.id,
    this.environmentId,
    this.organizationId,
    this.creatorId,
    this.feedId,
    this.layoutId,
    this.parentId,
    this.subject,
    this.name,
    this.title,
    required this.type,
    this.contentType,
    required this.content,
    this.variables,
    this.cta,
    this.active,
    this.preheader,
    this.senderName,
    this.actor,
    this.code,
    this.createdAt,
    this.updatedAt,
  });

  factory MessageTemplate.fromJson(Map<String, dynamic> json) => _$MessageTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$MessageTemplateToJson(this);

  // get String contentText => content.toString() if content is String else content.map((block) => block.content).join(' ');
}

@JsonSerializable()
class MessageActionResult {
  final Map<String, dynamic>? payload;
  final ButtonType? type;

  MessageActionResult({this.payload, this.type});

  factory MessageActionResult.fromJson(Map<String, dynamic> json) => _$MessageActionResultFromJson(json);

  Map<String, dynamic> toJson() => _$MessageActionResultToJson(this);
}

@JsonSerializable()
class MessageButton {
  late final ButtonType type;

  late final String content;

  final String? resultContent;

  final String? url;

  final String? target;

  MessageButton({
    required this.type,
    required this.content,
    this.resultContent,
    this.url,
    this.target,
  });

  factory MessageButton.fromJson(Map<String, dynamic> json) => _$MessageButtonFromJson(json);

  Map<String, dynamic> toJson() => _$MessageButtonToJson(this);
}

@JsonSerializable()
class MessageAction {
  final MessageActionStatus? status;
  final List<MessageButton>? buttons;
  final MessageActionResult? result;

  MessageAction({this.status, this.buttons, this.result});

  factory MessageAction.fromJson(Map<String, dynamic> json) => _$MessageActionFromJson(json);

  Map<String, dynamic> toJson() => _$MessageActionToJson(this);
}

@JsonSerializable()
class MessageCTAData {
  final String? url;
  final String? target;

  MessageCTAData({this.url, this.target});

  factory MessageCTAData.fromJson(Map<String, dynamic> json) => _$MessageCTADataFromJson(json);

  Map<String, dynamic> toJson() => _$MessageCTADataToJson(this);
}

@JsonSerializable()
class MessageCTA {
  late final ChannelCTAType type;
  late final MessageCTAData data;
  final MessageAction? action;

  MessageCTA({required this.type, required this.data, this.action});

  factory MessageCTA.fromJson(Map<String, dynamic> json) => _$MessageCTAFromJson(json);

  Map<String, dynamic> toJson() => _$MessageCTAToJson(this);
}