/// The [dart:async] is neccessary for using streams
import 'dart:async';

double CalculateTotal(cart) {
  double sum = 0;
  for (var product in cart) {
    sum += product.price * product.pquantity;
  }
  return sum;
}

double Calculate(cart) {
  double sum = 0;
  for (var product in cart) {
    sum += product.pquantity;
  }
  return sum;
}

class ItemsBloc {
  /// The [cartStreamController] is an object of the StreamController class
  /// .broadcast enables the stream to be read in multiple screens of our app
  final cartStreamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => cartStreamController.stream;

  final Map allItems = {'cart items': [], 'fav items': []};
  double sum() {
    double sum = 0;
    int i;
    for (i = 0; i < allItems['cart items'].length; i++) {
      sum = sum + allItems['cart items'][i].price;
    }
    return sum;
  }

  int num() => allItems['cart items'].length;

  void addToCart(item) {
    allItems['cart items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  void addToFav(item) {
    allItems['fav items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  void removeFromCart(item) {
    allItems['cart items'].remove(item);
    cartStreamController.sink.add(allItems);
  }

  void removeFromFav(item) {
    allItems['fav items'].remove(item);
    cartStreamController.sink.add(allItems);
  }

  /// The [dispose] method is used
  /// to automatically close the stream when the widget is removed from the widget tree
  void dispose() {
    cartStreamController.close(); // close our StreamController
  }
}

final bloc = ItemsBloc();
