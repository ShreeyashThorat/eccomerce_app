import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/pages/dashboard/cubit/nav_bar_items.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(const NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.products:
        emit(const NavigationState(NavbarItem.products, 1));
        break;
      case NavbarItem.orders:
        emit(const NavigationState(NavbarItem.orders, 2));
        break;
      case NavbarItem.profile:
        emit(const NavigationState(NavbarItem.profile, 3));
        break;
    }
  }
}
