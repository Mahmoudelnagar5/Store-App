import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/store_cubit/store_cubit.dart';
import 'package:store_app/cubit/store_cubit/store_states.dart';
import 'package:store_app/models/products_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  static const String id = 'CartPage';
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreStates>(
      builder: (context, state) {
        var cubit = BlocProvider.of<StoreCubit>(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: cubit.cartProducts.isEmpty
              ? const Center(child: Text('Your cart is empty'))
              : Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10,
                  ),
                  child: ListView.builder(
                    clipBehavior: Clip.none,
                    itemCount: cubit.cartProducts.length,
                    itemBuilder: (context, index) {
                      ProductModel product = cubit.cartProducts[index];
                      dynamic totalPrice = product.price *
                          product.quantity; // Calculate total price

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              child: Card(
                                color: Colors.white,
                                elevation: 5,
                                shadowColor: Colors.grey,
                                clipBehavior: Clip.none,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title.length > 6
                                            ? product.title.substring(0, 6)
                                            : product.title,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              cubit.removeFromCart(product);
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              size: 30,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(Icons.remove),
                                                onPressed: () {
                                                  if (product.quantity > 1) {
                                                    cubit.updateProductQuantity(
                                                        product,
                                                        product.quantity - 1);
                                                  } else {
                                                    cubit.removeFromCart(
                                                        product);
                                                  }
                                                },
                                              ),
                                              Text(
                                                product.quantity.toString(),
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.add),
                                                onPressed: () {
                                                  cubit.updateProductQuantity(
                                                      product,
                                                      product.quantity + 1);
                                                },
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '\$${totalPrice.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 100,
                              top: 15,
                              child: Image.network(
                                product.image,
                                height: 110,
                                width: 90,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
