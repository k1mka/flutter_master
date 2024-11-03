sealed class SurveyState {}

class SurveyInitial extends SurveyState {}

class SurveyLoading extends SurveyState {}

class SurveySuccessLoaded extends SurveyState {
  SurveySuccessLoaded(this.question);

  final String question;
}
