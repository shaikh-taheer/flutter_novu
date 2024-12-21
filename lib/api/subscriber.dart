import 'package:flutter_novu/api/base.dart';
import 'package:flutter_novu/dot/message.dart';
import 'package:flutter_novu/dot/notification.dart';
import 'package:flutter_novu/dot/shared.dart';
import 'package:flutter_novu/dot/subscriber.dart';
import 'package:flutter_novu/enums.dart';

class SubscriberApi extends BaseApi {
  SubscriberApi(super.baseUrl, super.apiKey);

  /// Get subscriber preferences
  ///
  /// [subscriberId] - The external subscriber identifier
  Future<List<SubscriberPreference>> getPreferences(String subscriberId) async {
    List<dynamic> response = (await request(method: ApiMethod.GET, endpoint: 'subscribers/$subscriberId/preferences'))['data'];
    return response.map((var r) => SubscriberPreference.fromJson(r)).toList();
  }


  Future<List<SubscriberPreference>> getPreferencesByLevel(String subscriberId, SubscriberPreferenceLevel level) async {
    List<dynamic> response = (await request(method: ApiMethod.GET, endpoint: 'subscribers/$subscriberId/preferences/${level.name}'))['data'];
    return response.map((var r) => SubscriberPreference.fromJson(r)).toList();
  }

  /// Update subscriber preference
  /// Activates or deactivates a channel for a subscriber on a specific template (workflow)
  ///
  /// [subscriberId] - The external subscriber identifier
  /// [templateId] - The internal template identifier
  /// [channel] - The channel to update
  /// [value] - The new value for the channel
  Future<SubscriberPreference> updatePreference(String subscriberId, String templateId, String channel, bool value) async {
    Map<String, dynamic> response = await request(
      method: ApiMethod.PATCH,
      endpoint: 'subscribers/$subscriberId/preferences/$templateId',
      data: {
        'channel': {
          'type': channel,
          'enabled': value,
        },
      }
    );
    return SubscriberPreference.fromJson(response['data']);
  }

  /// Get the number of unread in-app notifications for a subscriber
  ///
  /// [subscriberId] - The external subscriber identifier
  Future<int> getUnseenInAppNotificationCount(String subscriberId) async {
    Map<String, dynamic> response = (await request(method: ApiMethod.GET, endpoint: 'subscribers/$subscriberId/notifications/unseen'))['data'];
    return response['count']?.toInt() ?? 0;
  }

  Future<PaginatedResponse<Notification>> getInAppNotifications(String subscriberId, {int? page, int? limit, bool? read, bool? seen}) async {
    Map<String, dynamic> response = await request(method: ApiMethod.GET, endpoint: 'subscribers/$subscriberId/notifications/feed', query: {
      if (page != null) 'page': page,
      if (limit != null) 'limit': limit,
      if (read != null) 'read': read,
      if (seen != null) 'seen': seen,
    });
    return PaginatedResponse<Notification>(
      page: response['page'],
      totalCount: response['totalCount'],
      pageSize: response['pageSize'],
      hasMore: response['hasMore'],
      data: response['data'].map<Notification>((var r) => Notification.fromJson(r)).toList(),
    );
  }

  Future<Notification?> markInAppNotificationAs(String subscriberId, String messageId, MarkNotificationAs status) async {
    var ret = await request(method: ApiMethod.POST, endpoint: 'subscribers/$subscriberId/messages/mark-as', data: {
      'messageId': messageId,
      'markAs': status.name,
    });
    if (ret['data'].isNotEmpty) {
      return Notification.fromJson(ret['data'].first);
    }
    return null;
  }

  Future<int> markInAppNotificationsAs(String subscriberId, MarkNotificationAs status, [String? feedIdentifier]) async {
    var ret = await request(method: ApiMethod.POST, endpoint: 'subscribers/$subscriberId/messages/mark-all', data: {
      if (feedIdentifier != null) 'feedIdentifier': feedIdentifier,
      'markAs': status.name,
    });
    return ret['data'] as int;
  }
}