import 'package:cjb/firebase_options.dart';
import 'package:cjb/pages/main/notifications/push_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cjb/pages/splash/splash_page.dart';
import 'pages/onboarding/on_boarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final pubsubApi = await initializePubSub();
  const topicName = 'job-notifications';
  const subscriptionName = 'job-category-subscription';
  await createTopic(pubsubApi, 'job-notifications');
  final pushNotificationService = PushNotificationService();
  await pushNotificationService.initialize();
  await createSubscription(pubsubApi, subscriptionName, topicName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(
        child: OnBoardingScreen(),
      ),
    );
  }
}
