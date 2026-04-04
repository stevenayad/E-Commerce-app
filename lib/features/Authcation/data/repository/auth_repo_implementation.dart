import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/api_servcies.dart/api_consumer.dart';
import 'package:flutter_application_1/core/api_servcies.dart/failure.dart';
import 'package:flutter_application_1/features/Authcation/data/model/login_model..dart';
import 'package:flutter_application_1/features/Authcation/data/model/request_login.dart';
import 'package:flutter_application_1/features/Authcation/data/model/request_signin.dart';
import 'package:flutter_application_1/features/Authcation/data/model/signup_model.dart';
import 'package:flutter_application_1/features/Authcation/data/repository/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  final ApiConsumer apiConsumer;

  AuthRepoImplementation({required this.apiConsumer});
  @override
  Future<Either<Failure, LoginModel>> Login(RequestLogin requestsignin) async {
    try {
      final response = await apiConsumer.post(
        '/api/token/',
        requestsignin.toJson(),
        false,
      );
      if (response == null) {
        return Left(ServiveFailure("Invalid server response"));
      }
      final parsedModel = LoginModel.fromJson(response);
      return Right(parsedModel);
    } on DioException catch (e) {
      return Left(ServiveFailure.fromDioError(e));
    } catch (e) {
      return Left(ServiveFailure("Unexpected error, please try again"));
    }
  }

  @override
  Future<Either<Failure, SignupModel>> SignUp(
    RequestSignin requestsignup,
  ) async {
    try {
      final response = await apiConsumer.post(
        '/api/register/',
        requestsignup.toJson(),
        false,
      );
      if (response == null) {
        return Left(ServiveFailure("Invalid server response"));
      }
      final parsedModel = SignupModel.fromJson(response);
      return Right(parsedModel);
    } on DioException catch (e) {
      return Left(ServiveFailure.fromDioError(e));
    } catch (e) {
      return Left(ServiveFailure("Unexpected error, please try again"));
    }
  }
}
