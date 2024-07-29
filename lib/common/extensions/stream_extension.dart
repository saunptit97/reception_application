import 'dart:async';

extension StreamSubscriptionExtension<T> on StreamSubscription<T> {

  void addToList(List<StreamSubscription> subscriptions) {
    subscriptions.add(this);
  }
}

extension ListStreamSubscriptionExtension<T> on List<StreamSubscription<T>> {
  void cancelAll() {
    for (var subscription in this) {
      subscription.cancel();
    }
  }
}