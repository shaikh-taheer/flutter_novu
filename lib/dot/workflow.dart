import 'package:flutter_novu/dot/shared.dart';
import 'package:flutter_novu/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workflow.g.dart';

@JsonSerializable()
class WorkflowStepFilterChildren {
  late final String field;

  late final String value;

  late final WorkflowStepFilterChildrenOperator operator;

  late final WorkflowStepFilterChildrenOn on;

  WorkflowStepFilterChildren({
    required this.field,
    required this.value,
    required this.operator,
    required this.on,
  });

  factory WorkflowStepFilterChildren.fromJson(Map<String, dynamic> json) => _$WorkflowStepFilterChildrenFromJson(json);

  Map<String, dynamic> toJson() => _$WorkflowStepFilterChildrenToJson(this);
}


@JsonSerializable()
class WorkflowStepFilter {
  final bool? isNegated;

  final WorkflowStepFilterType? type;

  final WorkflowStepFilterValue? value;

  WorkflowStepFilter({
    this.isNegated,
    this.type,
    this.value,
  });

  factory WorkflowStepFilter.fromJson(Map<String, dynamic> json) => _$WorkflowStepFilterFromJson(json);

  Map<String, dynamic> toJson() => _$WorkflowStepFilterToJson(this);
}


@JsonSerializable()
class WorkflowStep {
  @JsonKey(name: '_id')
  final String? id;

  final String? uuid;

  final String? name;

  @JsonKey(name: '_templateId')
  final String? templateId;

  final bool? active;

  final bool? shouldStopOnFail;

  final String? template;

  final List<WorkflowStepFilter> filters;

  @JsonKey(name: '_parentId')
  final String? parentId;

  final List<WorkflowStep> variants;

  WorkflowStep({
    this.id,
    this.uuid,
    this.name,
    this.templateId,
    this.active,
    this.shouldStopOnFail,
    this.template,
    this.filters = const [],
    this.parentId,
    this.variants = const [],
  });

  factory WorkflowStep.fromJson(Map<String, dynamic> json) => _$WorkflowStepFromJson(json);

  Map<String, dynamic> toJson() => _$WorkflowStepToJson(this);
}


@JsonSerializable()
class WorkflowTriggerVariable {
  late final String id;

  late final String name;

  final String? value;

  WorkflowTriggerVariable({
    required this.id,
    required this.name,
    this.value,
  });

  factory WorkflowTriggerVariable.fromJson(Map<String, dynamic> json) => _$WorkflowTriggerVariableFromJson(json);

  Map<String, dynamic> toJson() => _$WorkflowTriggerVariableToJson(this);
}


@JsonSerializable()
class WorkflowTriggerSubscriberVariable {
  late final String id;

  late final String name;

  WorkflowTriggerSubscriberVariable({
    required this.id,
    required this.name,
  });

  factory WorkflowTriggerSubscriberVariable.fromJson(Map<String, dynamic> json) => _$WorkflowTriggerSubscriberVariableFromJson(json);

  Map<String, dynamic> toJson() => _$WorkflowTriggerSubscriberVariableToJson(this);
}


@JsonSerializable()
class WorkflowTrigger {
  late final WorkflowTriggerType type;

  late final String identifier;

  final List<WorkflowTriggerVariable> variables;

  final List<WorkflowTriggerSubscriberVariable> subscriberVariables;

  WorkflowTrigger({
    required this.type,
    required this.identifier,
    this.variables = const [],
    this.subscriberVariables = const [],
  });

  factory WorkflowTrigger.fromJson(Map<String, dynamic> json) => _$WorkflowTriggerFromJson(json);

  Map<String, dynamic> toJson() => _$WorkflowTriggerToJson(this);
}


@JsonSerializable()
class NotificationGroup {
  @JsonKey(name: '_id')
  final String? id;

  late final String name;

  @JsonKey(name: '_environmentId')
  late final String environmentId;

  @JsonKey(name: '_organizationId')
  late final String organizationId;

  @JsonKey(name: '_parentId')
  final String? parentId;

  NotificationGroup({
    this.id,
    required this.name,
    required this.environmentId,
    required this.organizationId,
    this.parentId,
  });

  factory NotificationGroup.fromJson(Map<String, dynamic> json) => _$NotificationGroupFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationGroupToJson(this);
}


@JsonSerializable()
class Workflow {
  @JsonKey(name: '_id')
  final String? id;

  late final String name;

  late final String description;

  late final bool active;

  late final bool draft;

  late final PreferenceChannel preferenceSettings;

  late final bool critical;

  late final List<String> tags;

  final List<WorkflowStep> steps;

  @JsonKey(name: '_organizationId')
  late final String organizationId;

  @JsonKey(name: '_creatorId')
  late final String creatorId;

  @JsonKey(name: '_environmentId')
  late final String environmentId;

  late final List<WorkflowTrigger> triggers;

  @JsonKey(name: '_notificationGroupId')
  late final String notificationGroupId;

  @JsonKey(name: '_parentId')
  final String? parentId;

  late final bool deleted;

  late final DateTime deletedAt;

  late final DateTime createdAt;

  late final DateTime updatedAt;

  late final String deletedBy;

  final Map<String, dynamic> data;

  @JsonKey(name: '__v')
  late final String v;

  Workflow({
    this.id,
    required this.name,
    required this.description,
    required this.active,
    required this.draft,
    required this.preferenceSettings,
    required this.critical,
    required this.tags,
    this.steps = const [],
    required this.organizationId,
    required this.creatorId,
    required this.environmentId,
    required this.triggers,
    required this.notificationGroupId,
    this.parentId,
    required this.deleted,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedBy,
    required this.data,
    required this.v,
  });

  factory Workflow.fromJson(Map<String, dynamic> json) => _$WorkflowFromJson(json);

  Map<String, dynamic> toJson() => _$WorkflowToJson(this);
}