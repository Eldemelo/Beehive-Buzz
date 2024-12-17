import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:beehive_buzz/flutter_flow/flutter_flow_radio_button.dart';
import 'package:beehive_buzz/flutter_flow/flutter_flow_widgets.dart';
import 'package:beehive_buzz/flutter_flow/flutter_flow_theme.dart';
import 'package:beehive_buzz/index.dart';
import 'package:beehive_buzz/main.dart';
import 'package:beehive_buzz/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:beehive_buzz/backend/firebase/firebase_config.dart';
import 'package:beehive_buzz/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();

    await FlutterFlowTheme.initialize();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  testWidgets('US4-GoldenPath', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(
        entryPage: LoginPageWidget(),
      ),
    ));

    await tester.pumpAndSettle();
    await tester.tap(find.byKey(ValueKey('LoginTab_k8wn')));
    await tester.enterText(
        find.byKey(ValueKey('Login_Email_483x')), 'ethan.demelo2000@gmail.com');
    await tester.enterText(
        find.byKey(ValueKey('Login_Password_00xj')), 'Edem1323!');
    await tester.pumpAndSettle(Duration(milliseconds: 5000));
    await tester.tap(find.byKey(ValueKey('Button_v4uz')));
    await tester.enterText(
        find.byKey(ValueKey('PostBody_02v4')), 'This is a robo test');
  });

  testWidgets('US1 Create Account', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: MyApp(),
    ));

    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(ValueKey('SignUp_Email_ptei')), 'newtestemail@gmail.com');
    await tester.enterText(
        find.byKey(ValueKey('SignUp_Password_70vb')), 'coolpassword12');
    await tester.enterText(
        find.byKey(ValueKey('SignUp_ConfirmPassword_5an3')), 'coolpassword12');
    await tester.tap(find.byKey(ValueKey('SignUp_Button_u7bb')));
    await tester.pumpAndSettle();
    expect(find.text('Home'), findsWidgets);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
