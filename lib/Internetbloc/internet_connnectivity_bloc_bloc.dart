import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'internet_connnectivity_bloc_event.dart';
part 'internet_connnectivity_bloc_state.dart';

class InternetConnnectivityBlocBloc extends Bloc<InternetConnnectivityBlocEvent,
    InternetConnnectivityBlocState> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? connectvitySubscription;
  InternetConnnectivityBlocBloc() : super(InternetConnnectivityBlocInitial()) {
    on<InternetConnectivityLostEvent>(
        (event, emit) => emit(InternetConnectivityLostState()));
    on<InternetConnectivityGetEvent>(
        (event, emit) => emit(InternetConnnectivityGetState()));

    connectvitySubscription =
        connectivity.onConnectivityChanged.listen((connnection) {
      if (connnection == ConnectivityResult.mobile ||
          connnection == ConnectivityResult.wifi) {
        add(InternetConnectivityGetEvent());
      } else {
        add(InternetConnectivityLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    connectvitySubscription?.cancel();
    return super.close();
  }
}
