import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/api_servcies.dart/failure.dart';
import 'package:flutter_application_1/features/Authcation/data/model/login_model..dart';
import 'package:flutter_application_1/features/Authcation/data/model/request_login.dart';
import 'package:flutter_application_1/features/Authcation/data/model/request_signin.dart';
import 'package:flutter_application_1/features/Authcation/data/model/signup_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, SignupModel>> SignUp(RequestSignin requestsignin);
  Future<Either<Failure, LoginModel>> Login(RequestLogin requestsignin);
}
