


### Stripe

- <https://stripe.dev/stripe-android/index.html?com/stripe/android/Stripe.html>

Aims to provide high-level functionality similar to the official mobile Stripe SDKs.

### CustomerSession

_Requires a Stripe ephemeral key._

- <https://stripe.com/docs/mobile/android/customer-information#customer-session-no-ui>
- <https://stripe.com/docs/mobile/android/standard#creating-ephemeral-keys>

Provides functionality similar to CustomerSession in the Stripe Android SDK.

### StripeApi

- <https://stripe.com/docs/api>

Provides basic low-level methods to access the Stripe REST API. 

- Limited to the APIs that can be used with a public key or ephemeral key.
- Library methods map to a Stripe API call with the same name.
- Additional parameters can be provided as an optional argument.


 _`Stripe` and `CustomerSession` use this internally._

## Initialization

All classes offer a singleton instance that can be initiated by calling the `init(...)` methods and then accessed through `.instance`.
Regular instances can also be created using the constructor, which allows them to be managed by e.g. dependency injection instead.

### Stripe

```dart
Stripe.init("pk_xxx");
// or, to manage your own instance, or multiple instances
final stripe = Stripe("pk_xxx);
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



