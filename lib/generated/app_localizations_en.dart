// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SNovuEn extends SNovu {
  SNovuEn([String locale = 'en']) : super(locale);

  @override
  String get inbox => 'Inbox';

  @override
  String get unreadOnly => 'Unread Only';

  @override
  String get archived => 'Archived';

  @override
  String get unreadAndRead => 'Unread & Read';

  @override
  String get markAllAsRead => 'Mark All as Read';

  @override
  String get archiveAll => 'Archive All';

  @override
  String get archiveRead => 'Archive Read';

  @override
  String get noUnreadNotifications => 'No unread notifications';

  @override
  String get noArchivedNotifications => 'No archived notifications';

  @override
  String get noNotifications => 'No notifications';

  @override
  String get markAsRead => 'Mark as Read';

  @override
  String get justNow => 'Just Now';

  @override
  String get unarchive => 'Unarchive';

  @override
  String get archive => 'Archive';

  @override
  String dateAgo(String date) {
    return '$date ago';
  }

  @override
  String get noNotificationSettings => 'No Notification Settings';

  @override
  String get noNotificationSettingsMessage =>
      'Your notification preferences will appear here\nonce they are loaded';

  @override
  String get refresh => 'Refresh';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsMessage =>
      'By setting up your notifications you will efficiently use this app';

  @override
  String novuChannel(String value) {
    String _temp0 = intl.Intl.selectLogic(
      value,
      {
        'email': 'Email',
        'sms': 'SMS',
        'push': 'Push',
        'in_app': 'In App',
        'inApp': 'In App',
        'chat': 'Chat',
        'other': 'Other',
      },
    );
    return '$_temp0';
  }

  @override
  String get globalPreferences => 'Global Preferences';

  @override
  String get notificationsPreferences => 'Notifications Preferences';
}
