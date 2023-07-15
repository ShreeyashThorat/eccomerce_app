import 'package:ecommerce_app/pages/Products/Product%20Widget/product_widgets.dart';
import 'package:ecommerce_app/pages/home/home_widget/home_widgets.dart';
import 'package:ecommerce_app/pages/home/product%20cubit/product_cubit.dart';
import 'package:ecommerce_app/pages/home/product%20cubit/product_state.dart';
import 'package:ecommerce_app/services/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Row(
          children: [
            const Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 15, right: 5),
              child: SearchBtn(),
            )),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 15),
              child: IconButton(
                  splashRadius: 25,
                  color: Colors.black,
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.sort)),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 15),
          child: Center(
            child: BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoadingState && state.products.isEmpty) {
                  return Wrap(
                    spacing: size.width * 0.02,
                    runSpacing: 10,
                    children: [
                      ...List.generate(
                          10,
                          (index) => Container(
                              width: MediaQuery.of(context).size.width * 0.44,
                              height: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              )))
                    ],
                  );
                } else if (state is ProductErrorState &&
                    state.products.isEmpty) {
                  return Text(state.errMessage.toString());
                }
                return Wrap(
                  spacing: size.width * 0.02,
                  runSpacing: 0,
                  children: [
                    ...List.generate(state.products.length, (index) {
                      final product = state.products[index];
                      return Container(
                        margin:
                            EdgeInsets.only(top: index % 2 == 0 ? 0.0 : 15.0),
                        child: ProductContainer(
                            imgUrl: "${product.imgUrl?[0]}",
                            productName: "${product.title}",
                            price: Formatter.formatPrice(
                                (product.price)!.toDouble())),
                      );
                    })
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
