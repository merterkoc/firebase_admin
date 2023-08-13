import 'package:firebase_admin/firebase_admin.dart';
import 'package:test/test.dart';

import 'resources/mocks.dart' as mocks;

Matcher throwsFirebaseError([String? code]) => throwsA(
    TypeMatcher<FirebaseException>().having((e) => e.code, 'code', code));

void main() {
  var admin = FirebaseAdmin.instance;
  group('Cloud Messaging', () {
    var mockApp = admin.initializeApp(mocks.appOptions, mocks.appName);
    var messaging = mockApp.messaging();

    test('send notification test', () {
      expect(() => messaging.send(mocks.messagingPayload),
          throwsFirebaseError('messaging/invalid-argument'));
    });
  });
}
