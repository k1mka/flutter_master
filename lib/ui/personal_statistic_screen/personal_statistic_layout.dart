import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master/ui/personal_statistic_screen/cubit/personal_statistic_cubit.dart';
import 'package:flutter_master/ui/personal_statistic_screen/cubit/personal_statistic_state.dart';
import 'package:flutter_master/ui/widgets/atoms/progress_template.dart';
import 'package:flutter_master/ui/widgets/pages/statistic_page.dart';

class PersonalStatisticLayout extends StatelessWidget {
  const PersonalStatisticLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonalStatisticCubit, PersonalStatisticState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (_, state) {
        return switch (state) {
          PersonalStatisticInitialState() => const SizedBox.shrink(),
          PersonalStatisticLoadingState() => const ProgressTemplate(),
          PersonalStatisticLoadedState() => Scaffold(
              body: StatisticPage(
                failedQuestions: state.failedQuestions,
                onItemDelete: (String item) =>
                    context.read<PersonalStatisticCubit>().onDeleteItem(item),
              ),
            )
        };
      },
    );
  }
}
