import 'package:flutter/material.dart';
import 'package:flutter_novu/generated/app_localizations.dart';
import 'package:flutter_novu/utils.dart';
import 'package:flutter_novu/widgets/content.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../dot/inbox_notification.dart';

class NotificationTile extends StatelessWidget {
  final InboxNotification notification;
  final Function(String notificationId)? onMarkAsRead;
  final Function(String notificationId)? onMarkAsArchived;
  final Function(String notificationId)? onMarkAsUnArchived;
  final Function(InboxNotification notification)? onTap;

  const NotificationTile({
    super.key,
    required this.notification,
    this.onMarkAsRead,
    this.onMarkAsArchived,
    this.onMarkAsUnArchived,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call(notification);
        if (notification.redirect != null &&
            notification.redirect!.url != null) {
          launchURL(notification.redirect!.url!);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        color: notification.isRead
            ? null
            : Theme.of(context).primaryColor.withValues(alpha: 0.05),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (notification.avatar != null &&
                    notification.avatar!.isNotEmpty)
                  _buildChannelIcon(),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(context),
                      const SizedBox(height: 4),
                      _buildContent(),
                      const SizedBox(height: 8),
                      _buildFooter(context),
                    ],
                  ),
                ),
                _buildReadIndicator(),
                _buildActionsButton(context),
              ],
            ),
            if (notification.primaryAction != null ||
                notification.secondaryAction != null)
              Row(
                children: [
                  Spacer(),
                  if (notification.primaryAction != null)
                    TextButton(
                      onPressed: () {
                        if (notification.primaryAction!.redirect != null &&
                            notification.primaryAction!.redirect!.url != null) {
                          launchURL(notification.primaryAction!.redirect!.url!);
                        }
                      },
                      child: Text(notification.primaryAction!.label),
                    ),
                  if (notification.secondaryAction != null)
                    TextButton(
                      onPressed: () {
                        if (notification.secondaryAction!.redirect != null &&
                            notification.secondaryAction!.redirect!.url != null) {
                          launchURL(notification.secondaryAction!.redirect!.url!);
                        }
                      },
                      child: Text(notification.secondaryAction!.label, style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
                    ),
                ],
              )
          ],
        ),
      ),
    );
  }

  Widget _buildChannelIcon() {
    IconData iconData = Icons.app_registration;
    Color iconColor = Colors.purple;
    var avatar = notification.avatar;

    // switch (notification.channel) {
    //   case ChannelType.email:
    //     iconData = Icons.email;
    //     iconColor = Colors.blue;
    //     break;
    //   case ChannelType.sms:
    //     iconData = Icons.sms;
    //     iconColor = Colors.green;
    //     break;
    //   case ChannelType.push:
    //     iconData = Icons.notifications;
    //     iconColor = Colors.orange;
    //     break;
    //   case ChannelType.inApp:
    //     iconData = Icons.app_registration;
    //     iconColor = Colors.purple;
    //     break;
    //   case ChannelType.chat:
    //     iconData = Icons.chat;
    //     iconColor = Colors.teal;
    //     break;
    //   default:
    //     iconData = Icons.notifications;
    //     iconColor = Colors.grey;
    // }

    if (avatar != null && avatar.isNotEmpty) {
      if (avatar.endsWith('svg')) {
        return SvgPicture.network(avatar, width: 40, height: 40,);
      }
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(iconData, color: iconColor, size: 20),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        if (notification.subject?.isNotEmpty == true)
          Expanded(
            child: Text(
              notification.subject!,
              style: TextStyle(
                fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
                fontSize: 16,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        // _buildStatusBadge(),
      ],
    );
  }

  Widget _buildContent() {
    return Content(text: notification.body);
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_time, size: 14, color: Colors.grey[500]),
        const SizedBox(width: 4),
        Text(
          _formatDate(context, notification.createdAt),
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 12,
          ),
        ),
        if (notification.isArchived == true) ...[
          const SizedBox(width: 8),
          Icon(Icons.archive, size: 14, color: Colors.grey[500]),
          const SizedBox(width: 4),
          Text(
            SNovu.of(context)!.archived,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildReadIndicator() {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.only(top: 8, right: 8),
      decoration: BoxDecoration(
        color: notification.isRead ? Colors.transparent : Colors.blue,
        shape: BoxShape.circle,
      ),
    );
  }

  // Widget _buildStatusBadge() {
  //   Color badgeColor;
  //   String statusText;
  //
  //   switch (notification.status) {
  //     case NotificationStatus.sent:
  //       badgeColor = Colors.green;
  //       statusText = 'Sent';
  //       break;
  //     case NotificationStatus.error:
  //       badgeColor = Colors.red;
  //       statusText = 'Error';
  //       break;
  //     case NotificationStatus.warning:
  //       badgeColor = Colors.orange;
  //       statusText = 'Warning';
  //       break;
  //     default:
  //       return const SizedBox.shrink();
  //   }
  //
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
  //     decoration: BoxDecoration(
  //       color: badgeColor.withOpacity(0.1),
  //       borderRadius: BorderRadius.circular(4),
  //       border: Border.all(color: badgeColor.withOpacity(0.3)),
  //     ),
  //     child: Text(
  //       statusText,
  //       style: TextStyle(
  //         color: badgeColor,
  //         fontSize: 10,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //   );
  // }

  Widget _buildActionsButton(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert, color: Colors.grey[600]),
      onSelected: (value) {
        switch (value) {
          case 'read':
            onMarkAsRead?.call(notification.id);
            break;
          case 'archive':
            onMarkAsArchived?.call(notification.id);
            break;
          case 'unarchive':
            onMarkAsUnArchived?.call(notification.id);
            break;
        }
      },
      itemBuilder: (context) => [
        if (!notification.isRead)
          PopupMenuItem(
            value: 'read',
            child: Row(
              children: [
                const Icon(Icons.mark_email_read),
                const SizedBox(width: 8),
                Text(SNovu.of(context)!.markAsRead),
              ],
            ),
          ),
        if (notification.isArchived != true)
          PopupMenuItem(
            value: 'archive',
            child: Row(
              children: [
                Icon(Icons.archive),
                SizedBox(width: 8),
                Text(SNovu.of(context)!.archive),
              ],
            ),
          ),
        if (notification.isArchived == true)
          PopupMenuItem(
            value: 'unarchive',
            child: Row(
              children: [
                Icon(Icons.archive),
                SizedBox(width: 8),
                Text(SNovu.of(context)!.unarchive),
              ],
            ),
          ),
      ],
    );
  }

  String _formatDate(BuildContext context, DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 1) {
      return SNovu.of(context)!.justNow;
    } else if (difference.inMinutes < 60) {
      return SNovu.of(context)!.dateAgo('${difference.inMinutes}m');
    } else if (difference.inHours < 24) {
      return SNovu.of(context)!.dateAgo('${difference.inHours}h');
    } else if (difference.inDays < 7) {
      return SNovu.of(context)!.dateAgo('${difference.inDays}d');
    } else {
      return DateFormat.yMMMd().format(date);
    }
  }
}