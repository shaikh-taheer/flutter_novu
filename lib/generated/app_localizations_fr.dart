// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class SNovuFr extends SNovu {
  SNovuFr([String locale = 'fr']) : super(locale);

  @override
  String get inbox => 'Boîte de Réception';

  @override
  String get unreadOnly => 'Uniquement Non Lu';

  @override
  String get archived => 'Archivé';

  @override
  String get unreadAndRead => 'Non Lu & Lu';

  @override
  String get markAllAsRead => 'Marquer Tout comme Lu';

  @override
  String get archiveAll => 'Archiver Tout';

  @override
  String get archiveRead => 'Archiver Lu';

  @override
  String get noUnreadNotifications => 'Aucune notification non lue';

  @override
  String get noArchivedNotifications => 'Aucune notification archivée';

  @override
  String get noNotifications => 'Aucune notification';

  @override
  String get markAsRead => 'Marquer comme Lu';

  @override
  String get justNow => 'Juste Maintenant';

  @override
  String get unarchive => 'Désarchiver';

  @override
  String get archive => 'Archiver';

  @override
  String dateAgo(String date) {
    return 'il y a $date';
  }

  @override
  String get noNotificationSettings => 'Aucun Paramètre de Notification';

  @override
  String get noNotificationSettingsMessage =>
      'Vos préférences de notification apparaîtront ici\nune fois qu\'elles seront chargées';

  @override
  String get refresh => 'Rafraîchir';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsMessage =>
      'En configurant vos notifications, vous utiliserez efficacement cette application';

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
        'other': 'Autre',
      },
    );
    return '$_temp0';
  }

  @override
  String get globalPreferences => 'Préférences Globales';

  @override
  String get notificationsPreferences => 'Préférences de Notifications';
}
