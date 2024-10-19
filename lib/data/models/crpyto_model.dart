import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/crypto_entity.dart';

part 'crpyto_model.g.dart';

@JsonSerializable()
class QuoteModel extends QuoteEntity {
  QuoteModel({
    super.price,
    super.volume_24h,
    super.percent_change_1h,
    super.percent_change_24h,
    super.percent_change_7d,
    super.market_cap,
    super.last_updated,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuoteModelToJson(this);
}

@JsonSerializable()
class CryptoModel extends CryptoEntity {
  @override
  final Map<String, QuoteModel>? quote;
  CryptoModel({
    super.id,
    super.name,
    super.symbol,
    super.slug,
    super.cmc_rank,
    super.is_active,
    super.is_fiat,
    super.self_reported_circulating_supply,
    super.self_reported_market_cap,
    super.num_market_pairs,
    super.circulating_supply,
    super.total_supply,
    super.max_supply,
    super.last_updated,
    super.date_added,
    super.tags,
    this.quote,
  }) : super(
          quote: quote,
        );

  factory CryptoModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoModelFromJson(json);
  Map<String, dynamic> toJson() => _$CryptoModelToJson(this);
}
