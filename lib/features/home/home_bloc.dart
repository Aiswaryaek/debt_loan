import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/debt_repositories.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  DebtRepository? debtRepository;

  HomeBloc({@required this.debtRepository}) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    switch (event.runtimeType) {
      case GetHomeEvent:
        yield* mapGetDivisionEventToState(event);
        break;
    }
  }

  Stream<HomeState> mapGetDivisionEventToState(HomeEvent event) async* {
    yield LoadingInProgressState();
    final results = await Future.wait([
      debtRepository!.getDebtData(),
    ]);
     yield FetchHomeCompletedState(results);
  }
}
