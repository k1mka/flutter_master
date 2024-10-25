import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master/core/templates/context_extensions.dart';
import 'package:flutter_master/ui/auth_screen/cubit/auth_cubit.dart';
import 'package:flutter_master/ui/auth_screen/cubit/auth_state.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessSavedIdState) {
            context.read<AuthCubit>().getUserSession();
          }
        },
        builder: (context, state) {
          return Expanded(
            child: switch (state) {
              AuthInitialState() => _AuthPage(
                  () => context.read<AuthCubit>().saveUserSession(),
                ),
              AuthSuccessSavedIdState() => _AuthPage(
                  () {},
                ),
              AuthSuccessGotIdState() => _AuthPage(
                  () {},
                ),
            },
          );
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
      children: [
        ElevatedButton(
          onPressed: onSignIn,
          child: Text(context.s.start_session),
        )
      ],
    );
  }
}
