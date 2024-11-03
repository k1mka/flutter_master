sealed class PersonalStatisticState {}

class PersonalStatisticInitialState extends PersonalStatisticState {}

class PersonalStatisticLoadingState extends PersonalStatisticState {}

class PersonalStatisticLoadedState extends PersonalStatisticState {
  PersonalStatisticLoadedState(this.failedQuestions);

  final List<String> failedQuestions;
}
