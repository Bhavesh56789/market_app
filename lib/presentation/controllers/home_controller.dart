import 'dart:async';

import 'package:get/get.dart';
import 'package:market_app/core/error/exceptions.dart';
import 'package:market_app/domain/entities/crypto_entity.dart';
import 'package:market_app/domain/usecases/get_latest_crpyto_list_usecase.dart';
import 'package:market_app/domain/usecases/get_trending_crpyto_list_usecase.dart';

class HomeController extends GetxController {
  final GetLatestCryptoListUseCase getLatestListUseCase;
  final GetTrendingCryptoListUseCase getTrendingListUseCase;

  HomeController(this.getLatestListUseCase, this.getTrendingListUseCase);

  var latestCryptoList = <CryptoEntity>[].obs;
  var trendingCryptoList = <CryptoEntity>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLists();
  }

  Future<void> fetchLists() async {
    try {
      isLoading.value = true;
      final firstListData = await getLatestListUseCase();
      final secondListData = await getTrendingListUseCase();
      latestCryptoList.assignAll(firstListData);
      trendingCryptoList.assignAll(secondListData);
    } catch (error) {
      errorMessage.value = _mapErrorToMessage(error);
    } finally {
      isLoading.value = false;
    }
  }

  String _mapErrorToMessage(dynamic error) {
    if (error is ServerException) {
      return 'Server error occurred.';
    } else if (error is TimeoutException) {
      return 'Connection timed out. Please try again.';
    } else if (error is CancelledException) {
      return 'Request was cancelled.';
    } else {
      return 'An unknown error occurred.';
    }
  }
}
