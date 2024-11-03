import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master/setup_service_locator.dart';
import 'package:flutter_master/ui/personal_statistic_screen/cubit/personal_statistic_cubit.dart';
import 'package:flutter_master/ui/personal_statistic_screen/personal_statistic_layout.dart';

class PersonalStatisticScreen extends StatelessWidget {
  const PersonalStatisticScreen({super.key});

  static const routeName = 'PersonalStatisticScreen';

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => PersonalStatisticCubit(getRepo),
        child: const PersonalStatisticLayout(),
      );
}
