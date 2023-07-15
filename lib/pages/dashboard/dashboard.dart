import 'package:ecommerce_app/pages/Orders/orders.dart';
import 'package:ecommerce_app/pages/Products/products.dart';
import 'package:ecommerce_app/pages/Profile/profile.dart';
import 'package:ecommerce_app/pages/dashboard/cubit/nav_bar_items.dart';
import 'package:ecommerce_app/pages/dashboard/cubit/navigation_cubit.dart';
import 'package:ecommerce_app/pages/home/home.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/widgets/my_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0.0,
          leading: backArrow(),
          title: Text(
            "Ecommerce App",
            style: TextStyle(
                fontSize: 23, fontWeight: FontWeight.w500, color: black),
          ),
        ),
        bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: white,
              selectedItemColor: black,
              unselectedItemColor: Colors.grey.shade600,
              elevation: 0,
              currentIndex: state.index,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              iconSize: 22,
              items: const [
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.house),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.store),
                  label: 'Products',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.cartShopping),
                  label: 'Orders',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.userTie),
                  label: 'Profile',
                ),
              ],
              onTap: (index) {
                if (index == 0) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.home);
                } else if (index == 1) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.products);
                } else if (index == 2) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.orders);
                } else if (index == 3) {
                  BlocProvider.of<NavigationCubit>(context)
                      .getNavBarItem(NavbarItem.profile);
                }
              },
            );
          },
        ),
        body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            if (state.navbarItem == NavbarItem.home) {
              return const Home();
            } else if (state.navbarItem == NavbarItem.products) {
              return const Products();
            } else if (state.navbarItem == NavbarItem.orders) {
              return const Orders();
            } else if (state.navbarItem == NavbarItem.profile) {
              return const Profile();
            }
            return Container();
          },
        ));
  }
}
