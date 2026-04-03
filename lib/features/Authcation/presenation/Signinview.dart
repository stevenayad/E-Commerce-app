import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api_servcies.dart/dio_consumer.dart';
import 'package:flutter_application_1/features/Authcation/data/repository/auth_repo_implementation.dart';
import 'package:flutter_application_1/features/Authcation/presenation/cubit/login/login_cubit.dart';
import 'package:flutter_application_1/features/Authcation/presenation/views/widget/sigininbody.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signinview extends StatelessWidget {
  const Signinview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => LoginCubit(
            authRepo: AuthRepoImplementation(apiConsumer: DioConsumer(Dio())),
          ),
      child: Scaffold(body: Signinbody()),
    );
  }
}
