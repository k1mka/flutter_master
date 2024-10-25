import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master/core/templates/context_extensions.dart';
import 'package:flutter_master/ui/auth_screen/cubit/auth_cubit.dart';
import 'package:flutter_master/ui/auth_screen/cubit/auth_state.dart';
import 'package:flutter_master/ui/survey_screen/survey_screen.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessSavedIdState) {
            context.r.push(SurveyScreen.routeName);
          }
        },
        builder: (context, state) {
          return switch (state) {
            AuthInitialState() => _AuthPage(
                () => context.read<AuthCubit>().saveUserSession(),
              ),
            AuthSuccessSavedIdState() => _AuthPage(
                () => context.r.push(SurveyScreen.routeName),
              ),
            AuthSuccessGotIdState() => _AuthPage(
                () {
                  // TODO(George): implement later
                },
              ),
          };
        },
      ),
    );
  }
}

class _AuthPage extends StatelessWidget {
  const _AuthPage(this.onSignIn);

  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: onSignIn,
            child: Text(context.s.start_session),
          ),
        )
      ],
    );
  }
}
