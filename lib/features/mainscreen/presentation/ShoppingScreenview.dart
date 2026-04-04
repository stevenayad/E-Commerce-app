import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api_servcies.dart/dio_consumer.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/cubits/cubit/product_cubit_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/mainscreen/data/repository/product repository/product_repo_implemtation.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/catergroychips.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/customappbar2.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/widget/productgird.dart';

class Shoppingscreenview extends StatelessWidget {
  const Shoppingscreenview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ProductCubit(
            repo: ProductRepoImplemtation(apiConsumer: DioConsumer(Dio())),
          )..getAllProducts(),
      child: Scaffold(
        appBar: customAppBar2(context, 'Shopping'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Catergroychips(),
              ),
              Productgird(isScroll: false),
            ],
          ),
        ),
      ),
    );
  }
}
