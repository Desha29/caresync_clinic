import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:care_sync/main.dart';

void main() {
  testWidgets('App starts and shows Login Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CareSyncApp());

    // Verify that the Login Page is shown.
    expect(find.text('CareSync'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
  });
}
