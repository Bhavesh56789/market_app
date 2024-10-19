import 'package:dio/dio.dart';
import 'package:market_app/data/models/crpyto_model.dart';
import '../../../core/error/exceptions.dart';

abstract class LatestListListApi {
  Future<List<CryptoModel>> fetchList();
}

class LatestListListApiImpl implements LatestListListApi {
  final Dio dio;

  LatestListListApiImpl({required this.dio});

  @override
  Future<List<CryptoModel>> fetchList() async {
    try {
      final response = await dio.get('/cryptocurrency/listings/latest');
      if (response.statusCode == 200) {
        final List data = response.data?['data'] ?? [];
        return data.map((json) => CryptoModel.fromJson(json)).toList();
      } else {
        throw ServerException();
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        throw ServerException('Server error: ${e.response?.statusCode}');
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw NetworkException('Connection timed out');
      } else if (e.type == DioExceptionType.cancel) {
        throw CancelledException();
      } else {
        throw UnknownException('An unknown error occurred');
      }
    }
  }
}
