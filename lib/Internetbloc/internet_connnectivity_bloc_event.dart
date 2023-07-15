part of 'internet_connnectivity_bloc_bloc.dart';

@immutable
abstract class InternetConnnectivityBlocEvent {}

class InternetConnectivityLostEvent extends InternetConnnectivityBlocEvent {}

class InternetConnectivityGetEvent extends InternetConnnectivityBlocEvent {}
