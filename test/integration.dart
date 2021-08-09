// This is a basic Flutter integration test
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:integration_test/integration_test.dart';
import 'package:integration_test/integration_test_driver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:integration_testing/main.dart';
import 'package:integration_testing/displaypage.dart';
/*
void smain() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
  //check on how to maps
  Future<void> writeResponseData(
Map<String, dynamic> data, {
String testOutputFilename = 'integration_response_data',
    String destinationDirectory,
})
}

 */




void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("When a user inputs a text", (WidgetTester tester) async {


    await tester.pumpWidget(MyApp());
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.byType(TypingPage),findsOneWidget);
    expect(find.byType(DisplayPage), findsNothing);

    expect(find.text('Input at least one character'), findsOneWidget);







  });
  testWidgets("When the User inputs a field Correctly according to the text field requirement",
          (WidgetTester tester)async{

    await tester.pumpWidget(MyApp());

    final inputText = 'Hello there, this is an input.';

    await tester.enterText(find.byKey(Key('your-text-field')), inputText);


    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();


    //expect(find.byType(TypingPage), findsNothing);
    expect(find.byType(DisplayPage), findsOneWidget);
    expect(find.text(inputText), findsOneWidget);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.byType(TypingPage),findsOneWidget);
    expect(find.byType(DisplayPage), findsNothing);

    expect(find.text(inputText), findsNothing);

  });



}

