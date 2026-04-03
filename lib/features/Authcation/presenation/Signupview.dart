import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/Authcation/presenation/views/widget/signupbody.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/api_servcies.dart/dio_consumer.dart';
import 'package:flutter_application_1/features/Authcation/data/repository/auth_repo_implementation.dart';
import 'package:flutter_application_1/features/Authcation/presenation/cubit/signup/cubit/signup_cubit.dart';
class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupCubit(
        authRepo: AuthRepoImplementation(
          apiConsumer: DioConsumer(Dio()),
        ),
      ),
      child: const Scaffold(
        body: SignupBody(),
      ),
    );
  }
}