import 'package:flutter/material.dart';
import 'package:flutter_novu/screens/notifications.dart';

import '../inbox.dart';

class Inbox extends StatefulWidget {
  final String backendUrl;
  final String socketUrl;
  final String applicationIdentifier;
  final String? subscriberId;
  final Widget? icon;

  const Inbox({super.key,
    required this.backendUrl,
    required this.socketUrl,
    required this.applicationIdentifier,
    this.subscriberId,
    this.icon,
  });

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  late final HeadlessService _headless;
  int unreadCount = 0;
  int unseenCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _headless = HeadlessService(
      backendUrl: widget.backendUrl,
      socketUrl: widget.socketUrl,
      applicationIdentifier: widget.applicationIdentifier,
      subscriberId: widget.subscriberId,
      onUnreadChanged: (count) {
        setState(() {
          unreadCount = count;
        });
      },
      onUnseenChanged: (count) {
        setState(() {
          unseenCount = count;
        });
      },
      onReceived: (notification) {
        // Handle received notification
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var icon =  IconButton(
      icon: widget.icon ?? const Icon(Icons.notifications),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute<void>(
          builder: (context) => NotificationsScreen(
            headlessService: _headless,
          ),
        ));
      },
    );
    if (unreadCount > 0) {
      return Badge(
        label: Text(unreadCount.toString()),
        offset: Offset(-4, 2),
        child: icon,
      );
    }

    return icon;
  }
}
