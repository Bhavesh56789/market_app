import 'package:market_app/domain/entities/crypto_entity.dart';
import '../repositories/crypto_list_repository.dart';

class GetLatestCryptoListUseCase {
  final CryptoListRepository repository;

  GetLatestCryptoListUseCase(this.repository);

  Future<List<CryptoEntity>> call() async {
    return await repository.getLatestCrytpoList();
  }
}
