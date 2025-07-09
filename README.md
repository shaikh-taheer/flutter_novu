Flutter Client for Novu Notification Platform

A Flutter package to integrate with the Novu notification platform. Novu provides an open-source notification infrastructure to manage, design, and deliver notifications across multiple channels like email, SMS, in-app, and push notifications.

Features
•	Seamless integration with the Novu notification platform.
•	Support for in-app notifications.
•	Flexible configurations for custom notification needs.
•	Easy-to-use APIs for sending, managing, and receiving notifications.

Installation

Add the package to your pubspec.yaml:

dependencies:
novu_flutter: ^0.1.0

Then run:

flutter pub get

Getting Started

1. Import the Package

import 'package:novu_flutter/novu_flutter.dart';

2. Initialize the Client

Before sending or receiving notifications, initialize the Novu client with your API key:

final novuClient = NovuClient(apiKey: 'YOUR_API_KEY');

3. Sending a Notification

await novuClient.sendNotification(
recipientId: 'user123',
templateId: 'welcome_email',
payload: {
'userName': 'John Doe',
'welcomeMessage': 'Welcome to our platform!',
},
);

4. Receiving In-App Notifications

Listen to real-time in-app notifications:

novuClient.onNotificationReceived((notification) {
print('New Notification: ${notification.title}');
});

5. Marking Notifications as Read

await novuClient.markAsRead(notificationId: 'notification123');

Configuration

API Key

Get your API key from your Novu Dashboard under the API settings. Replace 'YOUR_API_KEY' in the example code with your actual key.

Debugging

Enable debugging to see logs for API calls:

final novuClient = NovuClient(
apiKey: 'YOUR_API_KEY',
debug: true,
);

Example Project

Explore the example Flutter app in the example/ directory to see the Novu integration in action.

Contributing

Contributions are welcome! If you’d like to improve the package or add new features:
1.	Fork the repository.
2.	Create a new branch.
3.	Make your changes and test them.
4.	Submit a pull request.

Resources
•	Novu Documentation: https://docs.novu.co
•	Flutter Documentation: https://flutter.dev/docs

License

This project is licensed under the MIT License.

Let’s Connect!

Have questions or need help? Join the Novu Discord Community or open an issue in the GitHub repository.

Happy Coding! 🚀