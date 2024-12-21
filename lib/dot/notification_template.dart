import 'package:flutter_novu/dot/message_template.dart';
import 'package:flutter_novu/dot/shared.dart';
import 'package:flutter_novu/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_template.g.dart';

class Issue<T> {
  late final T issueType;

  late final String? variableName;

  late final String message;
}

@JsonSerializable()
class ContentIssue {
  late final StepContentIssueEnum issueType;

  late final String? variableName;

  late final String message;

  ContentIssue({
    required this.issueType,
    this.variableName,
    required this.message,
  });

  factory ContentIssue.fromJson(Map<String, dynamic> json) => _$ContentIssueFromJson(json);

  Map<String, dynamic> toJson() => _$ContentIssueToJson(this);
}

@JsonSerializable()
class StepIssue {
  late final StepIssueEnum issueType;

  late final String? variableName;

  late final String message;

  StepIssue({
    required this.issueType,
    this.variableName,
    required this.message,
  });

  factory StepIssue.fromJson(Map<String, dynamic> json) => _$StepIssueFromJson(json);

  Map<String, dynamic> toJson() => _$StepIssueToJson(this);
}

@JsonSerializable()
class StepIssues {
  final Map<String, StepIssue>? body;

  final Map<String, List<ContentIssue>>? controls;

  StepIssues({
    this.body,
    this.controls,
  });

  factory StepIssues.fromJson(Map<String, dynamic> json) => _$StepIssuesFromJson(json);

  Map<String, dynamic> toJson() => _$StepIssuesToJson(this);
}


@JsonSerializable()
class FilterParts {
  late final String field;

  late final dynamic value;

  late final FieldOperator operator;

  late final FilterPartTypeEnum on;

  final String? webhookUrl;

  final TimeOperator? timeOperator;

  late final String step;

  FilterParts({
    required this.field,
    required this.value,
    required this.operator,
    required this.on,
    this.webhookUrl,
    this.timeOperator,
    required this.step,
  });

  factory FilterParts.fromJson(Map<String, dynamic> json) => _$FilterPartsFromJson(json);

  Map<String, dynamic> toJson() => _$FilterPartsToJson(this);
}

@JsonSerializable()
class MessageFilter {
  final bool? isNegated;

  final BuilderFieldType? type;

  late final FieldLogicalOperator value;

  late final List<FilterParts> children;

  MessageFilter({
    this.isNegated,
    this.type,
    required this.value,
    required this.children,
  });

  factory MessageFilter.fromJson(Map<String, dynamic> json) => _$MessageFilterFromJson(json);

  Map<String, dynamic> toJson() => _$MessageFilterToJson(this);
}

@JsonSerializable()
class StepVariant {
  @JsonKey(name: '_id')
  final String id;

  final String? uuid;

  final String? stepId;

  final StepIssues? issues;

  final String? name;

  final List<MessageFilter>? filters;

  @JsonKey(name: '_templateId')
  final String? templateId;

  @JsonKey(name: '_parentId')
  final String? parentId;

  final MessageTemplate? template;

  final bool? active;

  final bool? shouldStopOnFail;

  final ReplyCallback? replyCallback;

  // metadata?: IWorkflowStepMetadata;
  // inputs?: {
  //   schema: JSONSchemaDto;
  // };
  // controls?: ControlSchemas;

  final Map<String, dynamic>? controlVariables;

  final String? bridgeUrl;

  StepVariant({
    required this.id,
    this.uuid,
    this.stepId,
    this.issues,
    this.name,
    this.filters,
    this.templateId,
    this.parentId,
    this.template,
    this.active,
    this.shouldStopOnFail,
    this.replyCallback,
    this.controlVariables,
    this.bridgeUrl,
  });

  factory StepVariant.fromJson(Map<String, dynamic> json) => _$StepVariantFromJson(json);

  Map<String, dynamic> toJson() => _$StepVariantToJson(this);
}

@JsonSerializable()
class NotificationTriggerVariable {
  late final String name;
  final dynamic value;
  final TemplateVariableType? type;

  NotificationTriggerVariable({
    required this.name,
    this.value,
    this.type,
  });

  factory NotificationTriggerVariable.fromJson(Map<String, dynamic> json) => _$NotificationTriggerVariableFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationTriggerVariableToJson(this);
}

@JsonSerializable()
class TriggerReservedVariable {
  late final TriggerContextTypeEnum type;

  late final List<NotificationTriggerVariable> variables;

  TriggerReservedVariable({
    required this.type,
    required this.variables,
  });

  factory TriggerReservedVariable.fromJson(Map<String, dynamic> json) => _$TriggerReservedVariableFromJson(json);

  Map<String, dynamic> toJson() => _$TriggerReservedVariableToJson(this);
}

@JsonSerializable()
class NotificationTrigger {
  late final TriggerType type;

  late final String identifier;

  late final List<NotificationTriggerVariable> variables;

  late final List<NotificationTriggerVariable>? subscriberVariables;

  late final List<TriggerReservedVariable>? reservedVariables;

  NotificationTrigger({
    required this.type,
    required this.identifier,
    required this.variables,
    this.subscriberVariables,
    this.reservedVariables,
  });

  factory NotificationTrigger.fromJson(Map<String, dynamic> json) => _$NotificationTriggerFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationTriggerToJson(this);
}

@JsonSerializable()
class NotificationStep {
  final List<StepVariant>? variants;

  final TriggerType? type;

  final String? identifier;

  NotificationStep({
    this.variants,
    this.type,
    this.identifier,
  });

  factory NotificationStep.fromJson(Map<String, dynamic> json) => _$NotificationStepFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationStepToJson(this);
}

@JsonSerializable()
class NotificationTemplate {
  @JsonKey(name: '_id')
  final String id;

  late final String name;

  final String? description;

  @JsonKey(name: '_notificationGroupId')
  late final String notificationGroupId;

  @JsonKey(name: '_organizationId')
  final String? parentId;

  @JsonKey(name: '_environmentId')
  final String environmentId;

  late final List<String> tags;

  final bool? draft;

  late final bool active;

  late final bool critical;

  late final PreferenceChannel preferenceSettings;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final List<NotificationStep> steps;

  late final List<NotificationTrigger> triggers;

  final bool? isBlueprint;

  final String? blueprintId;

  final WorkflowType? type;

  final Map<String, dynamic>? payloadSchema;

  final Map<String, dynamic>? rawData;

  final Map<String, dynamic>? data;

  NotificationTemplate({
    required this.id,
    required this.name,
    this.description,
    required this.notificationGroupId,
    this.parentId,
    required this.environmentId,
    required this.tags,
    this.draft,
    required this.active,
    required this.critical,
    required this.preferenceSettings,
    this.createdAt,
    this.updatedAt,
    required this.steps,
    required this.triggers,
    this.isBlueprint,
    this.blueprintId,
    this.type,
    this.payloadSchema,
    this.rawData,
    this.data,
  });

  factory NotificationTemplate.fromJson(Map<String, dynamic> json) => _$NotificationTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationTemplateToJson(this);
}