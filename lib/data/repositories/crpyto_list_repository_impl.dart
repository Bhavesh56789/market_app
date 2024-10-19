import 'package:market_app/data/datasources/api/latest_crpyto_list_api.dart';
import 'package:market_app/data/datasources/api/trending_crpyto_list_api.dart';
import 'package:market_app/domain/entities/crypto_entity.dart';
import '../../domain/repositories/crypto_list_repository.dart';

class CrpytoListRepositoryImpl implements CryptoListRepository {
  final TrendingListListApiImpl trendingListListApi;
  final LatestListListApiImpl latestListListApi;

  CrpytoListRepositoryImpl({
    required this.trendingListListApi,
    required this.latestListListApi,
  });

  @override
  Future<List<CryptoEntity>> getTrendingCryptoList() async {
    try {
      final list = await trendingListListApi.fetchList();
      return list.map((model) => model as CryptoEntity).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CryptoEntity>> getLatestCrytpoList() async {
    try {
      final list = await latestListListApi.fetchList();
      return list.map((model) => model as CryptoEntity).toList();
    } catch (e) {
      rethrow;
    }
  }
}
