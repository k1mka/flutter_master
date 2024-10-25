import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_master/domain/repository.dart';
import 'package:flutter_master/ui/auth_screen/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.repository) : super(AuthInitialState());

  final Repository repository;

  String generateRandomString() {
    const length = 50;
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return List.generate(length, (index) => characters[random.nextInt(characters.length)]).join();
  }

  void saveUserSession() async {
    final userId = generateRandomString();
    await repository.saveUserId(userId);
    emit(AuthSuccessSavedIdState());
  }

  void getUserSession() async {
    final userId = await repository.getUserId();
    if (userId == null) return;
    emit(AuthSuccessGotIdState(userId));
  }
}
