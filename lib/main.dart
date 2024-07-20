import 'dart:convert';

import 'package:cjb/firebase_options.dart';
import 'package:cjb/pages/main/notifications/push_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cjb/pages/splash/splash_page.dart';
import 'pages/onboarding/on_boarding_screen.dart';
import 'package:googleapis/pubsub/v1.dart' as pubsub;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'dart:io';
import 'package:googleapis/pubsub/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

import 'package:flutter/services.dart' show rootBundle;

Future<PubsubApi> initializePubSub() async {
  final jsonCredentials =
      await rootBundle.loadString('assets/service-account-file.json');
  final credentials = ServiceAccountCredentials.fromJson(jsonCredentials);
  final client =
      await clientViaServiceAccount(credentials, [PubsubApi.pubsubScope]);
  return PubsubApi(client);
}

// Create a new topic
Future<void> createTopic(PubsubApi pubsubApi, String topicName) async {
  try {
    await pubsubApi.projects.topics
        .create(Topic(), 'projects/cjb-app-429507/topics/$topicName');
  } catch (e) {
    print('Error creating topic: $e');
  }
}

// Create a new subscription
Future<void> createSubscription(
    PubsubApi pubsubApi, String subscriptionName, String topicName) async {
  try {
    await pubsubApi.projects.subscriptions.create(
        Subscription(topic: 'projects/cjb-app-429507/topics/$topicName'),
        'projects/cjb-app-429507/subscriptions/$subscriptionName');
  } catch (e) {
    print('Error creating subscription: $e');
  }
}

Future<void> createTopicIfNotExists(
    pubsub.PubsubApi pubsubApi, String projectID, String topicName) async {
  final topic = 'projects/$projectID/topics/$topicName';
  try {
    await pubsubApi.projects.topics.create(pubsub.Topic(), topic);
    print('Topic created: $topic');
  } catch (e) {
    if (e is pubsub.DetailedApiRequestError && e.status == 409) {
      print('Topic already exists: $topic');
    } else {
      rethrow;
    }
  }
}

Future<void> createSubscriptionIfNotExists(pubsub.PubsubApi pubsubApi,
    String projectID, String subscriptionName, String topicName) async {
  final subscription = 'projects/$projectID/subscriptions/$subscriptionName';
  final topic = 'projects/$projectID/topics/$topicName';
  try {
    await pubsubApi.projects.subscriptions.create(
      pubsub.Subscription(topic: topic),
      subscription,
    );
    print('Subscription created: $subscription');
  } catch (e) {
    if (e is pubsub.DetailedApiRequestError && e.status == 409) {
      print('Subscription already exists: $subscription');
    } else {
      rethrow;
    }
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  try {
    final pubsubApi = await initializePubSub();
    final serviceAccountJson = File('assets/service-account-file.json');
    final credentialsJson = await serviceAccountJson.readAsString();
    final projectID = jsonDecode(credentialsJson)['cjb-app-429507'];

    const topicName = 'job-notifications';
    const subscriptionName = 'job-category-subscription';
    await createTopicIfNotExists(pubsubApi, projectID, topicName);
    await createSubscriptionIfNotExists(
        pubsubApi, projectID, subscriptionName, topicName);

    final pushNotificationService = PushNotificationService();
    await pushNotificationService.initialize();
  } catch (e) {
    print('Error setting up Pub/Sub: $e');
  }

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
