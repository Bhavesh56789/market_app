import 'package:market_app/domain/entities/crypto_entity.dart';
import '../repositories/crypto_list_repository.dart';

class GetTrendingCryptoListUseCase {
  final CryptoListRepository repository;

  GetTrendingCryptoListUseCase(this.repository);

  Future<List<CryptoEntity>> call() async {
    return await repository.getTrendingCryptoList();
  }
}
