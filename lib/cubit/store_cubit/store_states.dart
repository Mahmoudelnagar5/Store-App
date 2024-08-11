// import 'package:store_app/models/products_model.dart';

// class StoreStates {}

// class InitialStoreState extends StoreStates {}

// class StoreLoadingState extends StoreStates {}

// class StoreLoadedState extends StoreStates {
//   final List<ProductModel> products;

//   StoreLoadedState(this.products);
// }

// class StoreErrorState extends StoreStates {
//   StoreErrorState(this.message);
//   final String message;
// }

// class ChangeBottomNavState extends StoreStates {}

// class RemoveProduct extends StoreStates {}

// class FavoriteState extends StoreStates {
//   final List<ProductModel> products;

//   FavoriteState(this.products);
// }
import 'package:store_app/models/products_model.dart';

class StoreStates {}

class InitialStoreState extends StoreStates {}

class StoreLoadingState extends StoreStates {}

class StoreLoadedState extends StoreStates {
  final List<ProductModel> products;

  StoreLoadedState(this.products);
}

class StoreErrorState extends StoreStates {
  StoreErrorState(this.message);
  final String message;
}

class ChangeBottomNavState extends StoreStates {}

class RemoveProduct extends StoreStates {}

class FavoriteState extends StoreStates {
  final List<ProductModel> products;

  FavoriteState(this.products);
}

class CartUpdatedState extends StoreStates {}

class CartState extends StoreStates {
  final List<ProductModel> products;

  CartState(this.products);
}
