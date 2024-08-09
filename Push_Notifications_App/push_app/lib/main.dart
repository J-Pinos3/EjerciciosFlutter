import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/config/router/router.dart';
import 'package:push_app/config/theme/app_theme.dart';
import 'package:push_app/presentation/blocs/notifications/notifications_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  //distribute notifications bloc to the whole application
  await NotificationsBloc.initializeFCM();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NotificationsBloc(),)
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
    );
  }
}
