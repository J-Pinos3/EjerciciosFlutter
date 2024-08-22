import 'dart:ffi';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_app/config/local_notifications/local_notifications.dart';
import 'package:push_app/domain/entities/push_message.dart';
import 'package:push_app/firebase_options.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  int pushNumberId = 0;

  //↓ function with no arguments that returns a Future<void>
  final Future<void> Function()? requestLocalNotificationPermissions; 
  final void Function({
    required int id,
    String? title,
    String? body,
    String? data,
  })? showLocalNotification;

  NotificationsBloc({
    this.showLocalNotification,
    this.requestLocalNotificationPermissions
    }) : super(const NotificationsState()) {

    
    on<NotificationStatusChanged>( _notificationStatusChanged );
    
    ///todo 3 crear el listener _onPushMessage Received
    on<NotificationReceived>(_onPushMessageReceived);

    _initalStatusCheck();
    _onForegroundMessage();
  }

  static Future<void> initializeFCM() async{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _notificationStatusChanged(NotificationStatusChanged event , Emitter<NotificationsState> emit){
    emit(
      state.copyWith(
        status: event.status
      )
    );
    _getFCMToken();
  }

  void _onPushMessageReceived(NotificationReceived event, Emitter<NotificationsState> emit){


    emit(
      state.copyWith(
        notifications: [ event.messageReceived, ...state.notifications ]
      )
    );
    _getFCMToken();
  }

  void _initalStatusCheck() async {
    final settings = await messaging.getNotificationSettings();
    add( NotificationStatusChanged(settings.authorizationStatus) );

    _getFCMToken();
  }

  void _getFCMToken() async{
    
    if(state.status != AuthorizationStatus.authorized){
      return;
    }

    final token = await messaging.getToken();
    print("token: $token");
  }

  void handleRemoteMessage( RemoteMessage message ) {

    if(message.notification == null){
      return;
    }

    final notification = PushMessage(
      messageId: message.messageId
        ?.replaceAll(":", "").replaceAll("%", "")
        ?? "",
      title: message.notification!.title ?? "",
      body: message.notification!.body ?? "",
      sentDate: message.sentTime ?? DateTime.now(),
      data: message.data,
      imageUrl: Platform.isAndroid
        ? message.notification!.android?.imageUrl ?? ""
        : message.notification!.apple?.imageUrl ?? ""
    );

    if( showLocalNotification != null ){
      showLocalNotification!(
        id: ++pushNumberId,//int.parse(  notification.messageId ),
        title: notification.title,
        body: notification.body,
        data: notification.messageId

      );
    }

    print(notification);
    add( NotificationReceived(notification) );
    
  }

  void _onForegroundMessage(){
    FirebaseMessaging.onMessage.listen( handleRemoteMessage );
  }

  void requestPermissions() async{
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    if(requestLocalNotificationPermissions != null){
      await requestLocalNotificationPermissions!();
      //await LocalNotifications.requestPermissionLocalNotifications();
    }
    
    add( NotificationStatusChanged(settings.authorizationStatus) );
    //settings.authorizationStatus;
  }

  PushMessage? getMessageById(String pushMessageId){
    final exist = state.notifications.any((element) => element.messageId == pushMessageId  );

    if( !exist ){
      return null;
    }
    else{
      return state.notifications.firstWhere((element) => element.messageId == pushMessageId);
    }
      
  }
}
