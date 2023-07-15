import 'package:ecommerce_app/pages/home/category%20cubit/category_cubit.dart';
import 'package:ecommerce_app/pages/home/category%20cubit/category_state.dart';
import 'package:ecommerce_app/pages/home/home_widget/home_widgets.dart';
import 'package:ecommerce_app/pages/home/product%20by%20category/product_by_category_bloc.dart';
import 'package:ecommerce_app/services/formatter.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  String categoryId = "6470f76b8f02d3536b4b458b";

  @override
  void initState() {
    productByCategoryBloc.add(ProductByCategoryInitialEvent(categoryId));
    super.initState();
  }

  final ProductByCategoryBloc productByCategoryBloc = ProductByCategoryBloc();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: searchButton(context)),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                width: size.width,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/shopping.jpg"))),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoadingState &&
                      state.categories.isEmpty) {
                    return shimmerTab(context);
                  } else if (state is CategoryErrorState &&
                      state.categories.isEmpty) {
                    return Text(state.errMessage.toString());
                  }
                  return Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        child: Row(
                          children: [
                            ...List.generate(
                                state.categories.length,
                                (index) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          currentTab = index;
                                          productByCategoryBloc.add(
                                              ProductByCategoryInitialEvent(
                                                  "${state.categories[index].sId}"));
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: index == 0 ? 0 : 5, right: 5),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 15),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: currentTab == index
                                                ? black
                                                : Colors.grey.shade200),
                                        child: Text(
                                          "${state.categories[index].title}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: currentTab == index
                                                ? white
                                                : Colors.black54,
                                          ),
                                        ),
                                      ),
                                    ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 18,
                                color: red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<ProductByCategoryBloc, ProductByCategoryState>(
                bloc: productByCategoryBloc,
                buildWhen: (previous, current) =>
                    current is! ProductByCategoryActionState,
                builder: (context, state) {
                  if (state is ProductByCategoryLoadingState &&
                      state.products.isEmpty) {
                    return Wrap(
                      spacing: size.width * 0.02,
                      runSpacing: 10,
                      children: [
                        ...List.generate(
                            4,
                            (index) => Container(
                                width: MediaQuery.of(context).size.width * 0.44,
                                height: MediaQuery.of(context).size.width * 0.7,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(20),
                                )))
                      ],
                    );
                  } else if (state is ProductByCategoryErrorState &&
                      state.products.isEmpty) {
                    return Text(state.errMessage.toString());
                  } else {
                    return Wrap(
                      spacing: size.width * 0.02,
                      runSpacing: 10,
                      children: [
                        ...List.generate(state.products.length, (index) {
                          final product = state.products[index];
                          return ProductContainer(
                              imgUrl: "${product.imgUrl?[0]}",
                              productName: "${product.title}",
                              price: Formatter.formatPrice(
                                  (product.price)!.toDouble()));
                        })
                      ],
                    );
                  }
                },
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ))
      ],
    );
  }
}
