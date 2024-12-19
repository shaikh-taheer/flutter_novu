import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.kebab)
enum ProviderId {
  slack,
  discord,
  msteams,
  mattermost,
  ryver,
  zulip,
  grafanaOnCall,
  getstream,
  rocketChat,
  whatsappBusiness,
  fcm,
  apns,
  expo,
  oneSignal,
  pushpad,
  pushWebhook,
  pusherBeams
}

enum ApiMethod { POST, GET, PUT, PATCH, DELETE }

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum WorkflowStepFilterType {
  boolean,
  text,
  date,
  number,
  statement,
  list,
  multiList,
  group
}

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum WorkflowStepFilterValue { and, or }

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum WorkflowStepFilterChildrenOperator {
  Larger,
  smaller,
  largerEqual,
  smallerEqual,
  equal,
  notEqual,
  allIn,
  anyIn,
  notIn,
  between,
  notBetween,
  like,
  notLike,
  @JsonValue('IN')
  iin
}

enum WorkflowStepFilterChildrenOn { subscriber, payload }

enum WorkflowTriggerType { event }

@JsonEnum(fieldRename: FieldRename.kebab)
enum ChannelType {
  inApp, email, sms, chat, push
}

enum SubscriberPreferenceLevel { global, template }