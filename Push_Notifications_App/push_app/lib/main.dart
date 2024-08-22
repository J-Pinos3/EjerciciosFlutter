import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:push_app/config/local_notifications/local_notifications.dart';
import 'package:push_app/config/router/router.dart';
import 'package:push_app/config/theme/app_theme.dart';
import 'package:push_app/presentation/blocs/notifications/notifications_bloc.dart';
/// 
/// TO DO IMPLEMENT LOCAL DATABASE TO SAVE NOTIFS
/// 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  //distribute notifications bloc to the whole application
  await NotificationsBloc.initializeFCM();


  await LocalNotifications.initializeLocalNotifications();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NotificationsBloc(
          showLocalNotification: LocalNotifications.showLocalNotification,
          requestLocalNotificationPermissions: LocalNotifications.requestPermissionLocalNotifications
        ),)
      ],
      child: const MainApp()
    )
  );
  
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Push Notifications App",
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
      builder: (context, child) => HandleNotificationInteractions(child: child!),
    );
  }
}


class HandleNotificationInteractions extends StatefulWidget {
  const HandleNotificationInteractions({super.key, required this.child});

  final Widget child;

  @override
  State<HandleNotificationInteractions> createState() => _HandleNotificationInteractionsState();
}

class _HandleNotificationInteractionsState extends State<HandleNotificationInteractions> {

  // It is assumed that all messages contain a data field with the key 'type'
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }
  
  void _handleMessage(RemoteMessage message) {

    context.read<NotificationsBloc>().handleRemoteMessage(message);

    final messageIdentificator = message.messageId
        ?.replaceAll(":", "")
        .replaceAll("%", "") ?? "";
    appRouter.push("/push-details/$messageIdentificator");

  }

  @override
  void initState() {
    super.initState();

    // Run code required to handle interacted messages in an async function
    // as initState() must not be async
    setupInteractedMessage();
  }


  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}