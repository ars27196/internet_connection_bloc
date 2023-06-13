import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';

part 'internet_state.dart';


class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? connect;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetLostEvent>((event, emit) {
      print("Lost event triggered");
    });

    on<InternetGainedEvent>((event, emit) {
      print("Gained event triggered");

    });

    connect = connectivity.onConnectivityChanged.listen((event) {
      print(event);
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    connect?.cancel();
    return super.close();
  }
}
