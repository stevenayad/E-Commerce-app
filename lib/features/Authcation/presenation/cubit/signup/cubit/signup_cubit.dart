import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/Authcation/data/model/request_signin.dart';
import 'package:flutter_application_1/features/Authcation/data/repository/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.authRepo}) : super(SignupInitial());

  final AuthRepo authRepo;

  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RequestSignin buildRequest() {
    return RequestSignin(
      email: emailController.text,
      first_name: firstNameController.text,
      last_name: lastNameController.text,
      password: passwordController.text,
    );
  }

  Future<void> signup() async {
    emit(SignupLoading());

    final result = await authRepo.SignUp(buildRequest());

    result.fold(
      (failure) => emit(SignupFailure(message: failure.errMessage)),
      (data) => emit(SignupSuccess()),
    );
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}