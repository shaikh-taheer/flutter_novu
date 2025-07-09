import 'package:flutter/material.dart';
import 'package:flutter_novu/dot/inbox_notification.dart';
import 'package:flutter_novu/enums.dart';
import 'package:flutter_novu/generated/app_localizations.dart';
import 'package:flutter_novu/inbox.dart';
import 'package:flutter_novu/screens/preferences.dart';
import 'package:flutter_novu/widgets/notification_tile.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

GetIt getIt = GetIt.instance;

enum PageFilter {
  all,
  archived,
  unread,
}

enum PageAction {
  markAllAsRead,
  archiveAll,
  archiveRead,
}

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  PageFilter view = PageFilter.all; // 'all', 'archived', 'unread'
  final ScrollController _scrollController = ScrollController();
  List<InboxNotification> _notifications = [];
  bool _isLoading = false;
  bool _hasMoreData = true;
  int _currentPage = 0;
  final int _pageSize = 20;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _loadNotifications();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!_isLoading && _hasMoreData) {
        _loadNotifications();
      }
    }
  }

  Future<void> _loadNotifications({bool refresh = false}) async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      if (refresh) {
        _currentPage = 0;
        _notifications.clear();
        _hasMoreData = true;
      }

      var response = await getIt<Inbox>().getNotifications(
        archived: view == PageFilter.archived,
        read: [PageFilter.all, PageFilter.archived].contains(view) ? null : false,
        page: _currentPage,
        limit: _pageSize,
      );

      setState(() {
        if (refresh) {
          _notifications = response.data;
        } else {
          _notifications.addAll(response.data);
        }
        _hasMoreData = response.data.length == _pageSize;
        _currentPage++;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _refreshNotifications() async {
    await _loadNotifications(refresh: true);
  }

  @override
  Widget build(BuildContext context) {
    var pageTitle = SNovu.of(context)!.inbox;
    switch (view) {
      case PageFilter.all:
        pageTitle = SNovu.of(context)!.inbox;
        break;
      case PageFilter.unread:
        pageTitle = SNovu.of(context)!.unreadOnly;
        break;
      case PageFilter.archived:
        pageTitle = SNovu.of(context)!.archived;
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: PopupMenuButton<PageFilter>(
          onSelected: (value) {
            setState(() {
              view = value;
              _refreshNotifications();
            });
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: PageFilter.all,
              child: Text(SNovu.of(context)!.unreadAndRead),
            ),
            PopupMenuItem(
              value: PageFilter.unread,
              child: Text(SNovu.of(context)!.unreadOnly),
            ),
            PopupMenuItem(
              value: PageFilter.archived,
              child: Text(SNovu.of(context)!.archived),
            ),
          ],
          child: Text.rich(TextSpan(
            children: [
              TextSpan(text: pageTitle),
              WidgetSpan(child: Icon(Icons.keyboard_arrow_down))
              // if (view != 'all') TextSpan(text: ' (${view.capitalize()})', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          )),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (context) => NotificationsPreferencesScreen(),
              ));
            },
            child: Icon(Icons.settings),
          ),
          PopupMenuButton<MarkAllNotificationAs>(
            onSelected: (value) {
              getIt<Inbox>().markAllNotificationAs(MarkAllNotificationAs.read);
              _refreshNotifications();
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: MarkAllNotificationAs.read,
                child: Text(SNovu.of(context)!.markAllAsRead),
              ),
              PopupMenuItem(
                value: MarkAllNotificationAs.archive,
                child: Text(SNovu.of(context)!.archiveAll),
              ),
              PopupMenuItem(
                value: MarkAllNotificationAs.readArchive,
                child: Text(SNovu.of(context)!.archiveRead),
              ),
            ],
          ),
        ],
        centerTitle: false,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshNotifications,
        child: _notifications.isEmpty ? _buildEmptyState() : ListView.builder(
          controller: _scrollController,
          itemCount: _notifications.length + (_hasMoreData ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == _notifications.length) {
              return _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox.shrink();
            }

            final notification = _notifications[index];
            return Column(
              children: [
                if (index > 0)
                  Divider(height: 0.2, indent: 10, endIndent: 10,),
                NotificationTile(
                  notification: notification,
                  onMarkAsArchived: (notificationId) async {
                    await getIt<Inbox>().markNotificationAs(
                        notificationId, MarkNotificationAs.archive);
                    setState(() {
                      _notifications = _notifications.where((n) => n.id != notificationId).toList();
                    });
                  },
                  onMarkAsUnArchived: (notificationId) async {
                    await getIt<Inbox>().markNotificationAs(
                        notificationId, MarkNotificationAs.unarchive);
                    setState(() {
                      _notifications = _notifications.where((n) => n.id != notificationId).toList();
                    });
                  },
                  onMarkAsRead: (notificationId) async {
                    await getIt<Inbox>().markNotificationAs(
                        notificationId, MarkNotificationAs.read);
                    _refreshNotifications();
                  },
                  onTap: (notification) async {
                    await getIt<Inbox>().markNotificationAs(
                        notification.id, MarkNotificationAs.read);
                    _refreshNotifications();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    String message;
    IconData icon;

    switch (view) {
      case PageFilter.unread:
        message = SNovu.of(context)!.noUnreadNotifications;
        icon = Icons.mark_email_read;
        break;
      case PageFilter.archived:
        message = SNovu.of(context)!.noArchivedNotifications;
        icon = Icons.archive;
        break;
      default:
        message = SNovu.of(context)!.noNotifications;
        icon = Icons.notifications_none;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
