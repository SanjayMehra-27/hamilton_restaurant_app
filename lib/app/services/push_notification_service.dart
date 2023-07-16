import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

// ignore: slash_for_doc_comments
/**
 * Documents added by Alaa, enjoy ^-^: https://medium.com/@alaa07996/firebase-push-notifications-with-flutter-6848892a1c15
 * There are 3 major things to consider when dealing with push notification :
 * - Creating the notification
 * - Hanldle notification click
 * - App status (foreground/background and killed(Terminated))
 * 
 * Creating the notification:
 * 
 * - When the app is killed or in background state, creating the notification is handled through the back-end services.
 *   When the app is in the foreground, we have full control of the notification. so in this case we build the notification from scratch.
 * 
 * Handle notification click:
 * 
 * - When the app is killed, there is a function called getInitialMessage which
 *   returns the remoteMessage in case we receive a notification otherwise returns null.
 *   It can be called at any point of the application (Preferred to be after defining GetMaterialApp so that we can go to any screen without getting any errors) 
 * - When the app is in the background, there is a function called onMessageOpenedApp which is called when user clicks on the notification.
 *   It returns the remoteMessage.
 * - When the app is in the foreground, there is a function flutterLocalNotificationsPlugin, is passes a future function called onSelectNotification which 
 *   is called when user clicks on the notification.
 *  
 * */
class PushNotificationService {
  // It is assumed that all messages contain a data field with the key 'type'
  Future<void> setupInteractedMessage() async {
    await Firebase.initializeApp();

    await Permission.notification.isDenied.then(
      (bool value) {
        if (value) {
          Permission.notification.request();
        }
      },
    );

    // Subscribe to a topic to receive notifications [When a lead is assigned to you]
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging.subscribeToTopic('lead_assigned_to_you');

// Get any messages which caused the application to open from a terminated state.
    // If you want to handle a notification click when the app is terminated, you can use `getInitialMessage`
    // to get the initial message, and depending in the remoteMessage, you can decide to handle the click
    // This function can be called from anywhere in your app, there is an example in main file.
    // RemoteMessage initialMessage =
    //     await FirebaseMessaging.instance.getInitialMessage();
    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    // if (initialMessage != null && initialMessage.data['type'] == 'chat') {
    // Navigator.pushNamed(context, '/chat',
    //     arguments: ChatArguments(initialMessage));
    // }
// Also handle any interaction when the app is in the background via a
    // Stream listener
    // This function is called when the app is in the background and user clicks on the notification
    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        log('onMessageOpenedApp: $message');
        if (message.data['type'] == 'chat') {
          // Navigator.pushNamed(context, '/chat',
          //     arguments: ChatArguments(message));
        }
      },
    );

    // This function is called when the app is in the foreground and user clicks on the notification
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('onMessage: ${message.data['message_type']}');
      // Get.find<HomeController>().getNotificationsNumber();
      if (message.data['type'] == 'chat') {
        // Navigator.pushNamed(context, '/chat',
        //     arguments: ChatArguments(message));
      }
    });

    // Event listener for when clicking on the notification

    await enableIOSNotifications();
    await registerNotificationListeners();
  }

  registerNotificationListeners() async {
    AndroidNotificationChannel channel = androidNotificationChannel();
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    var androidSettings = const AndroidInitializationSettings(
        '@drawable/ic_launcher'); // @mipmap/ic_launcher
    var iOSSettings = const IOSInitializationSettings(
        // requestSoundPermission: false,
        // requestBadgePermission: false,
        // requestAlertPermission: false,
        );
    var initSetttings =
        InitializationSettings(android: androidSettings, iOS: iOSSettings);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: (message) async {
      log('onSelectNotification: $message');
      // This function handles the click in the notification when the app is in foreground
      // Get.toNamed(NOTIFICATIOINS_ROUTE);
    });
// onMessage is called when the app is in foreground and a notification is received
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      // Get.find<HomeController>().getNotificationsNumber();
      if (kDebugMode) {
        print(message?.notification?.title);
      }
      RemoteNotification? notification = message!.notification;
      AndroidNotification? android = message.notification?.android;
// If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              importance: Importance.max,
              playSound: true,
              icon: '@drawable/ic_launcher',
            ),
            iOS: const IOSNotificationDetails(),
          ),
          payload: message.data['action_click'],
        );
      }
    });
  }

  /// This function return FCM token for a particular device
  Future<String> getDeviceToken() async {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    final String? token = await _firebaseMessaging.getToken();
    kDebugMode ? log('FCM token: $token') : null;
    return token ?? '';
  }

  enableIOSNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
    await FirebaseMessaging.instance.requestPermission(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }

  androidNotificationChannel() => const AndroidNotificationChannel(
        'quickest_notification_channel_id', // id
        'High Importance Notifications', // title
        description:
            'This channel is used for important notifications.', // description
        importance: Importance.max,
        sound: RawResourceAndroidNotificationSound('notification_sound'),
        playSound: true,
      );

  ///  Publishing a notification to a topic
  ///  https://firebase.google.com/docs/cloud-messaging/admin/send-messages#send_messages_to_topics

  final String serverKey =
      'AAAAjjdwRjU:APA91bGVUVYQs95GXQ2nFnlmK3nJZy99pOafFHb06jo37rAFAB7kNcvBRlHTKMg5ahjnrY28tcRRzLaD9VVxiV3r1PO59mE89RwaDCGrG5GzAOP39HxCLSAuU9ePzQRdl2d7aX76On_D';
  final String firebaseUrl = 'https://fcm.googleapis.com/fcm/send';

  ///  Sending a notification to a specific device
  ///  requires the device's registration token (FCM token), title, and body
  ///  returns a response from the server
  ///  https://firebase.google.com/docs/cloud-messaging/admin/send-messages#send_messages_to_specific_devices

  Future<http.Response> sendOneToOneNotification(List<String> userTokens,
      {required String title, required String body}) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };

    final data = <String, dynamic>{
      'notification': <String, dynamic>{
        'title': title,
        'body': body,
        'icon': 'assets/images/logo.png',
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        'sound': 'default',
      },
      'priority': 'high',
      'registration_ids': userTokens,
    };

    final jsonEncoded = json.encode(data);
    late final http.Response response;
    try {
      response = await http.post(
        Uri.parse(firebaseUrl),
        headers: headers,
        body: jsonEncoded,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return response;
  }
}
