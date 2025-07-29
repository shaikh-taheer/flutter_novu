# Novu's Flutter SDK for building custom inbox notification experiences

flutter_novu a Flutter library that helps to add a fully functioning Inbox to your web application in minutes. 
Let's do a quick recap on how you can easily use it in your application.


## Features

- Seamless integration with the Novu notification platform.
- Support for in-app notifications.
- Flexible configurations for custom notification needs.
- Easy-to-use APIs for sending, managing, and receiving notifications.

## Installation

```bash
flutter pub add flutter_novu
```

## Getting Started

Before you start using the Novu Flutter SDK, ensure you have a [Novu account](https://dashboard.novu.co/auth/sign-up) and have created a project. 

Follow these steps to integrate the SDK into your Flutter application:

### Import the Package

```dart
import 'package:flutter_novu/flutter_novu.dart';
```

### Connect to real subscribers

To connect the Inbox component with your Novu environment and real subscribers, set the `applicationIdentifier` and `subscriberId` in the `Inbox` widget.

```dart
import 'package:flutter_novu/flutter_novu.dart';

Inbox(
  applicationIdentifier: 'APPLICATION_IDENTIFIER',
  subscriberId: 'SUBSCRIBER_ID',
)
```

### Use your own backend and socket URL

By default, Novu's hosted services for API and socket are used. 
If you want, you can override them and configure your own.

```dart
import 'package:flutter_novu/flutter_novu.dart';

Inbox(
  backendUrl: 'YOUR_BACKEND_URL',
  socketUrl: 'YOUR_SOCKET_URL',
  applicationIdentifier: 'APPLICATION_IDENTIFIER',
  subscriberId: 'SUBSCRIBER_ID',
)
```

## Contributing

Contributions are welcome! If you’d like to improve the package or add new features:
1.	Fork the repository.
2.	Create a new branch.
3.	Make your changes and test them.
4.	Submit a pull request.

## Resources

- Novu Documentation: https://docs.novu.co
- Flutter Documentation: https://flutter.dev/docs

## License

This project is licensed under the MIT License.

Let’s Connect!
