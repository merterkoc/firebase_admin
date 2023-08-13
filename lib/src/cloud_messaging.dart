import 'package:firebase_admin/src/app.dart';
import 'package:firebase_admin/src/service.dart';
import 'package:firebase_admin/src/utils/api_request.dart';
import 'package:googleapis/fcm/v1.dart' as fcm;
import 'package:googleapis/fcm/v1.dart';

class CloudMessaging implements FirebaseService {
  @override
  final App app;

  final fcm.FirebaseCloudMessagingApi messaging;

  @override
  Future<void> delete() async {}

  CloudMessaging(
    this.app,
  ) : messaging = fcm.FirebaseCloudMessagingApi(AuthorizedHttpClient(app));

  Future<void> send(SendMessageRequest messagingPayload) async {
    var messaging = fcm.FirebaseCloudMessagingApi(AuthorizedHttpClient(app));
    await messaging.projects.messages.send(
      messagingPayload,
      'projects/${app.options.projectId}',
    );
  }
}
