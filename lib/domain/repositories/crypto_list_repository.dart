import '../entities/crypto_entity.dart';

abstract class CryptoListRepository {
  Future<List<CryptoEntity>> getTrendingCryptoList();
  Future<List<CryptoEntity>> getLatestCrytpoList();
}
