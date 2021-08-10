
## Initialization

All classes offer a singleton instance that can be initiated by calling the `init(...)` methods and then accessed through `.instance`.
Regular instances can also be created using the constructor, which allows them to be managed by e.g. dependency injection instead.


```dart
await tester.pumpWidget(MyApp());
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.byType(TypingPage),findsOneWidget);
    expect(find.byType(DisplayPage), findsNothing);

    expect(find.text('Input at least one character'), findsOneWidget);
```

#

## UI



```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IntTesting App',
      home: TypingPage(),
    );
  }
}

class TypingPage extends StatefulWidget {
  TypingPage({Key key}) : super(key: key);

  @override
  _TypingPageState createState() => _TypingPageState();
}

class _TypingPageState extends State<TypingPage> {
  TextEditingController _controller;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Typing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: TextFormField(
              key: Key('your-text-field'),
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your Text',
              ),
              validator: (value) =>
              value.isEmpty ? 'Input at least one character' : null,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return DisplayPage(
                    displayText: _controller.text,
                    doOnInit: () => Future.microtask(() => _controller.clear()),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}




```



