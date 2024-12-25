library flutter_novu;

import 'dart:async';

import 'package:flutter_novu/api/base.dart';
import 'package:flutter_novu/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'dot.dart' as Dot;

// final StreamController<NotificationEvent> notificationEventsStream = StreamController<NotificationEvent>.broadcast();

class Novu {
  final String backendUrl;
  final String socketUrl;
  late final String applicationIdentifier;
  final String? subscriberId;
  final String? subscriberHash;
  final int? retry;
  final int retryDelay;
  final SharedPreferencesAsync prefs = SharedPreferencesAsync();
  final Function(int)? onUnreadChanged;
  final Function(int)? onUnseenChanged;
  final Function(Dot.Notification)? onReceived;
  final Function(String)? onConnected;

  IO.Socket? _socket;

  Novu({
    this.backendUrl = 'https://api.novu.co',
    this.socketUrl = 'https://ws.novu.co',
    required this.applicationIdentifier,
    this.subscriberId,
    this.subscriberHash,
    this.retry,
    this.retryDelay = 10000,
    this.onUnreadChanged,
    this.onUnseenChanged,
    this.onReceived,
    this.onConnected,
  }) {
    var api = BaseApi(backendUrl);
    api.request(method: ApiMethod.POST, endpoint: 'inbox/session', data: {'applicationIdentifier': applicationIdentifier, 'subscriberId': subscriberId}).then((response) {
      var value = response['data'];
      prefs.setString('novu_token', value['token']);
      initializeSocket(value['token']);
      if (value.containsKey('totalUnreadCount') && onUnreadChanged != null) {
        onUnreadChanged!(value['totalUnreadCount']);
      }
      if (onConnected != null) {
        onConnected!(value['token']);
      }
    });
    // _socket = WebSocketChannel.connect(Uri.parse(socketUrl));
  }

  void initializeSocket([String? token]) async {
    if (_socket != null) {
      _socket?.close();
    }

    if (token != null) {
      _socket = IO.io(socketUrl, {
        'reconnectionDelayMax': retryDelay,
        'transports': ['websocket'],
        'query': {'token': token},
      });

      if (onReceived != null) {
        _socket!.on(WebSocketEvent.received.value, (data) {
          if (data['message'] != null) {
            onReceived!(Dot.Notification.fromJson(data['message']!));
          }
        });
      }

      if (onUnreadChanged != null) {
        _socket!.on(WebSocketEvent.unread.value, (data) {
          onUnreadChanged!(data['unreadCount']);
        });
      }

      if (onUnseenChanged != null) {
        _socket!.on(WebSocketEvent.unseen.value, (data) {
          onUnseenChanged!(data['unseenCount']);
        });
      }

      _socket!.on('connect_error', (error) {
        print('Error: $error');
      });
      // _socket = WebSocketChannel.connect(Uri.parse('${socketUrl.replaceAll('http', 'ws')}/socket.io/?token=$token&EIO=4&transport=websocket'), protocols: ['websocket']);
      //
      // await _socket!.ready;
      //
      // _socket!.stream.listen((event) {
      //   print(event);
      // });
      //
      // _socket!.sink.add('2probe');
    }
  }
}
