import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/api_servcies.dart/failure.dart';
import 'package:flutter_application_1/features/mainscreen/data/Model/product_model.dart';

abstract class product_repo {
  Future<Either<Failure, List<ProductModel>>> getallitem();
  Future<Either<Failure, List<ProductModel>>> getitemByCategory(
    String category,
  );
  Future<Either<Failure, List<ProductModel>>> getpopularproduct();
  Future<Either<Failure, ProductModel>> getproductbyid(int id);
  Future<Either<Failure,  List<ProductModel>>> getproductbysearch(String name);
}
