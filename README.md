
## Initialization

All classes offer a singleton instance that can be initiated by calling the `init(...)` methods and then accessed through `.instance`.
Regular instances can also be created using the constructor, which allows them to be managed by e.g. dependency injection instead.

### Stripe

```dart
await tester.pumpWidget(MyApp());
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.byType(TypingPage),findsOneWidget);
    expect(find.byType(DisplayPage), findsNothing);

    expect(find.text('Input at least one character'), findsOneWidget);
```

### CustomerSession

The function that retrieves the ephemeral key must return the JSON response as a plain string.

```dart
CustomerSession.init((apiVersion) => server.getEphemeralKeyFromServer(apiVersion));
// or, to manage your own instances
final session = CustomerSession((apiVersion) => server.getEphemeralKeyFromServer(apiVersion))
```

### StripeApi

```dart
StripeApi.init("pk_xxx");
// or, to manage your own instances
final stripeApi = StripeApi("pk_xxx);
```

## UI

Use `CardForm` to add or edit credit card details, or build your own form using the pre-built FormFields.

```dart
final formKey = GlobalKey<FormState>();
final card = StripeCard();

final form = CardForm(card:card, formKey: formKey);
 
onPressed: () async {
                if (formKey.currentState.validate()) {
                  formKey.currentState.save();
                }
}


```



