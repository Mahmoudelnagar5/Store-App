import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/store_cubit/store_cubit.dart';
import 'package:store_app/cubit/store_cubit/store_states.dart';
import 'package:store_app/models/products_model.dart';

class Customfav extends StatelessWidget {
  const Customfav({
    required this.product,
    super.key,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreStates>(
      builder: (context, state) {
        return Stack(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.length > 6
                            ? product.title.substring(0, 6)
                            : product.title,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' + product.price.toString(),
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<StoreCubit>(context)
                                  .removeProduct(product);
                            },
                            icon: const Icon(
                              Icons.delete,
                              size: 24,
                              color: Colors.red,
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
              top: -10,
              child: Image.network(
                product.image,
                height: 110,
                width: 90,
              ),
            ),
          ],
        );
      },
    );
  }
}
