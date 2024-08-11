import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/store_cubit/store_states.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/screens/cart_page.dart';
import 'package:store_app/screens/category_page.dart';
import 'package:store_app/screens/favorite_page.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/services/get_all_products_service.dart';

class StoreCubit extends Cubit<StoreStates> {
  StoreCubit() : super(InitialStoreState());
  List<ProductModel> products = [];
  List<ProductModel> favoriteProducts = [];
  List<ProductModel> cartProducts = [];

  Future<void> getProducts() async {
    try {
      emit(StoreLoadingState());
      products = await AllProductsService().getAllProducts();
      emit(StoreLoadedState(products));
    } catch (e) {
      emit(StoreErrorState(e.toString()));
    }
  }

  void removeProduct(ProductModel product) {
    favoriteProducts.remove(product);
    emit(FavoriteState(favoriteProducts));
  }

  bool isProductFavorite(ProductModel product) {
    product.isFavorite = !product.isFavorite;
    if (product.isFavorite) {
      favoriteProducts.add(product);
    } else {
      favoriteProducts.remove(product);
    }
    emit(FavoriteState(favoriteProducts));
    return product.isFavorite;
  }

  void addToCart(ProductModel product) {
    bool productExists = false;

    for (var cartProduct in cartProducts) {
      if (cartProduct.title == product.title) {
        // Product already in cart, update the quantity
        productExists = true;
        updateProductQuantity(cartProduct, cartProduct.quantity + 1);
        break;
      }
    }

    if (!productExists) {
      // Add product to cart with default quantity 1
      cartProducts.add(product);
      emit(CartUpdatedState());
    }
  }

  // Method to remove product from the cart
  void removeFromCart(ProductModel product) {
    cartProducts.remove(product);
    emit(CartUpdatedState());
  }

  // Method to update product quantity
  void updateProductQuantity(ProductModel product, int newQuantity) {
    for (var cartProduct in cartProducts) {
      if (cartProduct.title == product.title) {
        if (newQuantity > 0) {
          cartProduct.quantity = newQuantity;
        } else {
          removeFromCart(
              product); // Remove from cart if quantity is zero or less
        }
        emit(CartUpdatedState());
        return; // Exit the method once the product is updated
      }
    }
  }

  int currentIndex = 0;

  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorite',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: 'Category',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Cart',
    ),
  ];

  final List<Widget> screens = [
    const HomePage(),
    const FavoritePage(),
    const CategoryPage(),
    const CartPage(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  Widget getCurrentScreen() {
    return screens[currentIndex];
  }
}
