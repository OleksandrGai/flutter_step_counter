import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/step_repository.dart';

class StepsCountBloc extends Bloc<_FetchStepsEvent, StepsState> {
  final StepRepository stepRepository;

  StepsCountBloc( this.stepRepository) : super(Steps([],)) {
    on<_FetchStepsEvent>((event, emit) async {
      emit(LoadingState());
      final steps = await stepRepository.initStepData();
      final totalSteps = await stepRepository.totalSteps();
      emit(Steps(steps,totalSteps));
    });
    add(_FetchStepsEvent());
  }
}

class _FetchStepsEvent {}

abstract class StepsState {}

class LoadingState extends StepsState {}

class Steps with ListBase<int> implements StepsState {
  final List<int> _steps;
  int? totalSteps;

  Steps(this._steps, [this.totalSteps]);

  @override
  int get length => _steps.length;

  @override
  int operator [](int index) {
    return _steps[index];
  }

  @override
  void operator []=(int index, int value) {
    _steps[index] = value;
  }

  @override
  set length(int newLength) {
    _steps.length = newLength;
  }
}
