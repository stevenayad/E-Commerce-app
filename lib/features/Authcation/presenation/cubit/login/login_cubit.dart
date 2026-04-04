import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api_servcies.dart/cache_helper.dart';
import 'package:flutter_application_1/features/Authcation/data/model/login_model..dart';

import 'package:flutter_application_1/features/Authcation/data/model/request_login.dart';
import 'package:flutter_application_1/features/Authcation/data/repository/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(LoginInitial());

  final AuthRepo authRepo;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RequestLogin buildRequest() {
    return RequestLogin(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  Future<void> login() async {
    emit(LoginLoading());

    final result = await authRepo.Login(buildRequest());

    result.fold((failure) => emit(LoginFailure(message: failure.errMessage)), (
      data,
    ) {
      if (data.access != null) {
        CacheHelper.saveAccessToken(data.access!);
      }
      emit(LoginSuccess(loginModel: data));
    });
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
