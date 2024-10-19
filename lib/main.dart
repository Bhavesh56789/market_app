import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:market_app/data/datasources/api/latest_crpyto_list_api.dart';
import 'package:market_app/data/datasources/api/trending_crpyto_list_api.dart';
import 'package:market_app/data/repositories/crpyto_list_repository_impl.dart';
import 'package:market_app/domain/usecases/get_latest_crpyto_list_usecase.dart';
import 'package:market_app/domain/usecases/get_trending_crpyto_list_usecase.dart';
import 'package:market_app/presentation/controllers/home_controller.dart';
import 'package:market_app/presentation/pages/home_page.dart';

void main() {
  // Dio instance for API calls
  Dio dio = Dio(
    BaseOptions(
        headers: {'X-CMC_PRO_API_KEY': '551ced7b-2e50-4bb3-b6ac-65108a3c18a6'},
        baseUrl: 'https://pro-api.coinmarketcap.com/v1'),
  );

  // Injecting dependencies
  Get.put<LatestListListApiImpl>(LatestListListApiImpl(dio: dio));
  Get.put<TrendingListListApiImpl>(TrendingListListApiImpl(dio: dio));

  Get.put(CrpytoListRepositoryImpl(
    latestListListApi: Get.find(),
    trendingListListApi: Get.find(),
  ));

  Get.put(GetLatestCryptoListUseCase(Get.find<CrpytoListRepositoryImpl>()));
  Get.put(GetTrendingCryptoListUseCase(Get.find<CrpytoListRepositoryImpl>()));

  Get.put(HomeController(Get.find(), Get.find()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}
