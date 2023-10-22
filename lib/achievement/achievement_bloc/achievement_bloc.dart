import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_step_counter/repositories/achievement%20_repository.dart';

import '../../repositories/step_repository.dart';

// class AchievementBloc extends Bloc<_AchievementEvent, AchievementState> {
//   final AchievementRepository achievementRepository;
//   final StepRepository stepRepository;
//
//   AchievementBloc(this.achievementRepository) : super(LoadingState())  {
//
//   }
// }
//
// class _AchievementEvent {}
//
// abstract class AchievementState {}
//
// class LoadingState extends AchievementState {}
//
// class InitialState extends AchievementState {
//   InitialState({required this.goal, required this.nextGoal});
//
//   final int goal;
//   final int nextGoal;
// }

// class Achievement with ListBase<int> implements AchievementState {
//   final List<int> _steps;
//   int? totalSteps;
//
//   Steps(this._steps, [this.totalSteps]);
//
//   @override
//   int get length => _steps.length;
//
//   @override
//   int operator [](int index) {
//     return _steps[index];
//   }
//
//   @override
//   void operator []=(int index, int value) {
//     _steps[index] = value;
//   }
//
//   @override
//   set length(int newLength) {
//     _steps.length = newLength;
//   }
// }
