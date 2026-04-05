import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/api_servcies.dart/api_consumer.dart';
import 'package:flutter_application_1/core/api_servcies.dart/failure.dart';
import 'package:flutter_application_1/features/mainscreen/data/Model/product_model.dart';
import 'package:flutter_application_1/features/mainscreen/data/repository/product%20repository/product_repo.dart';

class ProductRepoImplemtation implements product_repo {
  final ApiConsumer apiConsumer;

  ProductRepoImplemtation({required this.apiConsumer});
  @override
  Future<Either<Failure, List<ProductModel>>> getallitem() async {
    try {
      final respone = await apiConsumer.get('product/');
      if (respone == null) {
        return Left(ServiveFailure("Invalid server response"));
      }
      List<ProductModel> items = [];
      for (var item in respone['products']) {
        final parseditem = ProductModel.fromJson(item);
        items.add(parseditem);
      }
      return Right(items);
    } on DioException catch (e) {
      return Left(ServiveFailure.fromDioError(e));
    } catch (e) {
      return Left(ServiveFailure("Unexpected error, please try again"));
    }
  }

  Future<Either<Failure, List<ProductModel>>> getitemByCategory(
    String category,
  ) async {
    try {
      final respone = await apiConsumer.get(
        'product/filter?category=$category',
      );

      if (respone == null) {
        return Left(ServiveFailure("Invalid server response"));
      }

      List<ProductModel> items = [];

      for (var item in respone['products']) {
        items.add(ProductModel.fromJson(item));
      }

      return Right(items);
    } on DioException catch (e) {
      return Left(ServiveFailure.fromDioError(e));
    } catch (e) {
      return Left(ServiveFailure("Unexpected error, please try again"));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getpopularproduct() async {
    try {
      final respone = await apiConsumer.get('product/Pagination/?page=1');

      if (respone == null) {
        return Left(ServiveFailure("Invalid server response"));
      }

      List<ProductModel> items = [];

      for (var item in respone['products']) {
        items.add(ProductModel.fromJson(item));
      }

      return Right(items);
    } on DioException catch (e) {
      return Left(ServiveFailure.fromDioError(e));
    } catch (e) {
      return Left(ServiveFailure("Unexpected error, please try again"));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> getproductbyid(int id) async {
    try {
      final respone = await apiConsumer.get('product/$id');
      if (respone == null) {
        return Left(ServiveFailure("Invalid server response"));
      }

      final parseditem = ProductModel.fromJson(respone['product']);

      return Right(parseditem);
    } on DioException catch (e) {
      return Left(ServiveFailure.fromDioError(e));
    } catch (e) {
      return Left(ServiveFailure("Unexpected error, please try again"));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getproductbysearch(
    String name,
  ) async {
    try {
      final respone = await apiConsumer.get('product/filter?keyword=$name');

      if (respone == null) {
        return Left(ServiveFailure("Invalid server response"));
      }

      List<ProductModel> items = [];

      for (var item in respone['products']) {
        items.add(ProductModel.fromJson(item));
      }

      return Right(items);
    } on DioException catch (e) {
      return Left(ServiveFailure.fromDioError(e));
    } catch (e) {
      return Left(ServiveFailure("Unexpected error, please try again"));
    }
  }
}
