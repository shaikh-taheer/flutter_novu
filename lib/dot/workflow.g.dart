// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkflowStepFilterChildren _$WorkflowStepFilterChildrenFromJson(
        Map<String, dynamic> json) =>
    WorkflowStepFilterChildren(
      field: json['field'] as String,
      value: json['value'] as String,
      operator: $enumDecode(
          _$WorkflowStepFilterChildrenOperatorEnumMap, json['operator']),
      on: $enumDecode(_$WorkflowStepFilterChildrenOnEnumMap, json['on']),
    );

Map<String, dynamic> _$WorkflowStepFilterChildrenToJson(
        WorkflowStepFilterChildren instance) =>
    <String, dynamic>{
      'field': instance.field,
      'value': instance.value,
      'operator':
          _$WorkflowStepFilterChildrenOperatorEnumMap[instance.operator]!,
      'on': _$WorkflowStepFilterChildrenOnEnumMap[instance.on]!,
    };

const _$WorkflowStepFilterChildrenOperatorEnumMap = {
  WorkflowStepFilterChildrenOperator.Larger: 'LARGER',
  WorkflowStepFilterChildrenOperator.smaller: 'SMALLER',
  WorkflowStepFilterChildrenOperator.largerEqual: 'LARGER_EQUAL',
  WorkflowStepFilterChildrenOperator.smallerEqual: 'SMALLER_EQUAL',
  WorkflowStepFilterChildrenOperator.equal: 'EQUAL',
  WorkflowStepFilterChildrenOperator.notEqual: 'NOT_EQUAL',
  WorkflowStepFilterChildrenOperator.allIn: 'ALL_IN',
  WorkflowStepFilterChildrenOperator.anyIn: 'ANY_IN',
  WorkflowStepFilterChildrenOperator.notIn: 'NOT_IN',
  WorkflowStepFilterChildrenOperator.between: 'BETWEEN',
  WorkflowStepFilterChildrenOperator.notBetween: 'NOT_BETWEEN',
  WorkflowStepFilterChildrenOperator.like: 'LIKE',
  WorkflowStepFilterChildrenOperator.notLike: 'NOT_LIKE',
  WorkflowStepFilterChildrenOperator.iin: 'IN',
};

const _$WorkflowStepFilterChildrenOnEnumMap = {
  WorkflowStepFilterChildrenOn.subscriber: 'subscriber',
  WorkflowStepFilterChildrenOn.payload: 'payload',
};

WorkflowStepFilter _$WorkflowStepFilterFromJson(Map<String, dynamic> json) =>
    WorkflowStepFilter(
      isNegated: json['isNegated'] as bool?,
      type: $enumDecodeNullable(_$WorkflowStepFilterTypeEnumMap, json['type']),
      value:
          $enumDecodeNullable(_$WorkflowStepFilterValueEnumMap, json['value']),
    );

Map<String, dynamic> _$WorkflowStepFilterToJson(WorkflowStepFilter instance) =>
    <String, dynamic>{
      'isNegated': instance.isNegated,
      'type': _$WorkflowStepFilterTypeEnumMap[instance.type],
      'value': _$WorkflowStepFilterValueEnumMap[instance.value],
    };

const _$WorkflowStepFilterTypeEnumMap = {
  WorkflowStepFilterType.boolean: 'BOOLEAN',
  WorkflowStepFilterType.text: 'TEXT',
  WorkflowStepFilterType.date: 'DATE',
  WorkflowStepFilterType.number: 'NUMBER',
  WorkflowStepFilterType.statement: 'STATEMENT',
  WorkflowStepFilterType.list: 'LIST',
  WorkflowStepFilterType.multiList: 'MULTI_LIST',
  WorkflowStepFilterType.group: 'GROUP',
};

const _$WorkflowStepFilterValueEnumMap = {
  WorkflowStepFilterValue.and: 'AND',
  WorkflowStepFilterValue.or: 'OR',
};

WorkflowStep _$WorkflowStepFromJson(Map<String, dynamic> json) => WorkflowStep(
      id: json['_id'] as String?,
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      templateId: json['_templateId'] as String?,
      active: json['active'] as bool?,
      shouldStopOnFail: json['shouldStopOnFail'] as bool?,
      template: json['template'] as String?,
      filters: (json['filters'] as List<dynamic>?)
              ?.map(
                  (e) => WorkflowStepFilter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      parentId: json['_parentId'] as String?,
      variants: (json['variants'] as List<dynamic>?)
              ?.map((e) => WorkflowStep.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$WorkflowStepToJson(WorkflowStep instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'uuid': instance.uuid,
      'name': instance.name,
      '_templateId': instance.templateId,
      'active': instance.active,
      'shouldStopOnFail': instance.shouldStopOnFail,
      'template': instance.template,
      'filters': instance.filters,
      '_parentId': instance.parentId,
      'variants': instance.variants,
    };

WorkflowTriggerVariable _$WorkflowTriggerVariableFromJson(
        Map<String, dynamic> json) =>
    WorkflowTriggerVariable(
      id: json['id'] as String,
      name: json['name'] as String,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$WorkflowTriggerVariableToJson(
        WorkflowTriggerVariable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
    };

WorkflowTriggerSubscriberVariable _$WorkflowTriggerSubscriberVariableFromJson(
        Map<String, dynamic> json) =>
    WorkflowTriggerSubscriberVariable(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$WorkflowTriggerSubscriberVariableToJson(
        WorkflowTriggerSubscriberVariable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

WorkflowTrigger _$WorkflowTriggerFromJson(Map<String, dynamic> json) =>
    WorkflowTrigger(
      type: $enumDecode(_$WorkflowTriggerTypeEnumMap, json['type']),
      identifier: json['identifier'] as String,
      variables: (json['variables'] as List<dynamic>?)
              ?.map((e) =>
                  WorkflowTriggerVariable.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      subscriberVariables: (json['subscriberVariables'] as List<dynamic>?)
              ?.map((e) => WorkflowTriggerSubscriberVariable.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$WorkflowTriggerToJson(WorkflowTrigger instance) =>
    <String, dynamic>{
      'type': _$WorkflowTriggerTypeEnumMap[instance.type]!,
      'identifier': instance.identifier,
      'variables': instance.variables,
      'subscriberVariables': instance.subscriberVariables,
    };

const _$WorkflowTriggerTypeEnumMap = {
  WorkflowTriggerType.event: 'event',
};

NotificationGroup _$NotificationGroupFromJson(Map<String, dynamic> json) =>
    NotificationGroup(
      id: json['_id'] as String?,
      name: json['name'] as String,
      environmentId: json['_environmentId'] as String,
      organizationId: json['_organizationId'] as String,
      parentId: json['_parentId'] as String?,
    );

Map<String, dynamic> _$NotificationGroupToJson(NotificationGroup instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      '_environmentId': instance.environmentId,
      '_organizationId': instance.organizationId,
      '_parentId': instance.parentId,
    };

Workflow _$WorkflowFromJson(Map<String, dynamic> json) => Workflow(
      id: json['_id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String,
      active: json['active'] as bool,
      draft: json['draft'] as bool,
      preferenceSettings: PreferenceChannel.fromJson(
          json['preferenceSettings'] as Map<String, dynamic>),
      critical: json['critical'] as bool,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      steps: (json['steps'] as List<dynamic>?)
              ?.map((e) => WorkflowStep.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      organizationId: json['_organizationId'] as String,
      creatorId: json['_creatorId'] as String,
      environmentId: json['_environmentId'] as String,
      triggers: (json['triggers'] as List<dynamic>)
          .map((e) => WorkflowTrigger.fromJson(e as Map<String, dynamic>))
          .toList(),
      notificationGroupId: json['_notificationGroupId'] as String,
      parentId: json['_parentId'] as String?,
      deleted: json['deleted'] as bool,
      deletedAt: DateTime.parse(json['deletedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedBy: json['deletedBy'] as String,
      data: json['data'] as Map<String, dynamic>,
      v: json['__v'] as String,
    );

Map<String, dynamic> _$WorkflowToJson(Workflow instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'active': instance.active,
      'draft': instance.draft,
      'preferenceSettings': instance.preferenceSettings,
      'critical': instance.critical,
      'tags': instance.tags,
      'steps': instance.steps,
      '_organizationId': instance.organizationId,
      '_creatorId': instance.creatorId,
      '_environmentId': instance.environmentId,
      'triggers': instance.triggers,
      '_notificationGroupId': instance.notificationGroupId,
      '_parentId': instance.parentId,
      'deleted': instance.deleted,
      'deletedAt': instance.deletedAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedBy': instance.deletedBy,
      'data': instance.data,
      '__v': instance.v,
    };
