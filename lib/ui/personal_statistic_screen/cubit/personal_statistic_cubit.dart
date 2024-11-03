import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master/domain/repository.dart';
import 'package:flutter_master/ui/personal_statistic_screen/cubit/personal_statistic_state.dart';

class PersonalStatisticCubit extends Cubit<PersonalStatisticState> {
  PersonalStatisticCubit(this.repository) : super(PersonalStatisticInitialState()) {
    getFailedQuestions();
  }

  final Repository repository;

  void onDeleteItem(String item) async {
    emit(PersonalStatisticLoadingState());
    final result = await repository.deleteFailedItem(item);
    emit(PersonalStatisticLoadedState(result ?? []));
  }

  void getFailedQuestions() async {
    emit(PersonalStatisticLoadingState());
    final result = await repository.getFailedList();
    emit(PersonalStatisticLoadedState(result ?? []));
  }
}
