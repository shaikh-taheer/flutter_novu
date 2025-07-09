import 'package:flutter/material.dart';
import 'package:flutter_novu/dot/inbox_notification.dart';
import 'package:flutter_novu/generated/app_localizations.dart';
import 'package:flutter_novu/inbox.dart';
import 'package:flutter_novu/widgets/notification_preferences.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class NotificationsPreferencesScreen extends StatefulWidget {
  const NotificationsPreferencesScreen({super.key});

  @override
  State<NotificationsPreferencesScreen> createState() =>
      _NotificationsPreferencesScreenState();
}

class _NotificationsPreferencesScreenState
    extends State<NotificationsPreferencesScreen> {
  List<PreferencesResponse> _preferences = [];

  @override
  void initState() {
    super.initState();

    getIt<Inbox>().fetchPreferences().then((var preferences) {
      setState(() {
        _preferences = preferences;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          SNovu.of(context)!.notificationsPreferences,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: NotificationPreferences(
        preferences: _preferences,
        onRefresh: () async {
          // getIt<Inbox>().fetchPreferences().then((var preferences) {
          //   context.read<AppConfigsCubit>().setNotificationsPreferences(preferences);
          // });
        },
      ),
    );
  }
}
