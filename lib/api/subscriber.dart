import 'package:flutter_novu/api/base.dart';
import 'package:flutter_novu/dot/subscriber.dart';
import 'package:flutter_novu/enums.dart';

class SubscriberApi extends BaseApi {
  SubscriberApi(super.baseUrl, super.apiKey);

  /// Get subscriber preferences
  ///
  /// [subscriberId] - The external subscriber identifier
  Future<List<SubscriberPreference>> getPreferences(String subscriberId) async {
    var response = await request<List<dynamic>>(method: ApiMethod.GET, endpoint: 'subscribers/$subscriberId/preferences');
    return response.map((var r) => SubscriberPreference.fromJson(r)).toList();
  }


  Future<List<SubscriberPreference>> getPreferencesByLevel(String subscriberId, SubscriberPreferenceLevel level) async {
    var response = await request<List<dynamic>>(method: ApiMethod.GET, endpoint: 'subscribers/$subscriberId/preferences/${level.name}');
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
    var response = await request<Map<String, dynamic>>(
      method: ApiMethod.PATCH,
      endpoint: 'subscribers/$subscriberId/preferences/$templateId',
      data: {
        'channel': {
          'type': channel,
          'enabled': value,
        },
      }
    );
    return SubscriberPreference.fromJson(response);
  }
}