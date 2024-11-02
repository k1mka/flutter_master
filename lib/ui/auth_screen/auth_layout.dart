import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master/core/templates/context_extensions.dart';
import 'package:flutter_master/ui/auth_screen/cubit/auth_cubit.dart';
import 'package:flutter_master/ui/auth_screen/cubit/auth_state.dart';
import 'package:flutter_master/ui/profile_screen/profile_screen.dart';
import 'package:flutter_master/ui/widgets/atoms/progress_template.dart';
import 'package:flutter_master/ui/widgets/pages/auth_page.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessSavedIdState) {
            context.r.replace(ProfileScreen.routeName);
          }
        },
        builder: (_, state) {
          return switch (state) {
            AuthInitialState() => AuthPage(
                onSignIn: () => context.read<AuthCubit>().saveUserSession(),
              ),
            AuthSuccessSavedIdState() => const ProgressTemplate(),
            AuthSuccessGotIdState() => const ProgressTemplate(),
          };
        },
      ),
    );
  }
}
