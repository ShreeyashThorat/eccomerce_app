part of 'internet_connnectivity_bloc_bloc.dart';

@immutable
abstract class InternetConnnectivityBlocState {}

class InternetConnnectivityBlocInitial extends InternetConnnectivityBlocState {}

class InternetConnectivityLostState extends InternetConnnectivityBlocState {}

class InternetConnnectivityGetState extends InternetConnnectivityBlocState {}
