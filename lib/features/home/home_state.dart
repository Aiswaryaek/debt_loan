part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingInProgressState extends HomeState {}

class FetchHomeCompletedState extends HomeState {
  dynamic homeData;

  FetchHomeCompletedState(this.homeData);
}
