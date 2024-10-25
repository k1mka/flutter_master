import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master/setup_service_locator.dart';
import 'package:flutter_master/ui/auth_screen/auth_layout.dart';
import 'package:flutter_master/ui/auth_screen/cubit/auth_cubit.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static const routeName = '/AuthScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getRepo),
      child: const AuthLayout(),
    );
  }
}
