integration_testing

Running tests is a very essential phase in the development lifecycle of an application,
whether its a unit, widget test or integration test,
here's a sample of how integration test is done using the flutter driver library
...
#Requirements
Ensure to add integration_test: ^1.0.1
to your pubspec.yaml,
you could also enable multidex for compatibility in some android versions..


created a new test file...

...dart
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
