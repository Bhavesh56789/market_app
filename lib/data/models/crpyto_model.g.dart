// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crpyto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteModel _$QuoteModelFromJson(Map<String, dynamic> json) => QuoteModel(
      price: (json['price'] as num?)?.toDouble(),
      volume_24h: (json['volume_24h'] as num?)?.toDouble(),
      percent_change_1h: (json['percent_change_1h'] as num?)?.toDouble(),
      percent_change_24h: (json['percent_change_24h'] as num?)?.toDouble(),
      percent_change_7d: (json['percent_change_7d'] as num?)?.toDouble(),
      market_cap: (json['market_cap'] as num?)?.toDouble(),
      last_updated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$QuoteModelToJson(QuoteModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'volume_24h': instance.volume_24h,
      'percent_change_1h': instance.percent_change_1h,
      'percent_change_24h': instance.percent_change_24h,
      'percent_change_7d': instance.percent_change_7d,
      'market_cap': instance.market_cap,
      'last_updated': instance.last_updated?.toIso8601String(),
    };

CryptoModel _$CryptoModelFromJson(Map<String, dynamic> json) => CryptoModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      slug: json['slug'] as String?,
      cmc_rank: (json['cmc_rank'] as num?)?.toDouble(),
      is_active: json['is_active'] as bool?,
      is_fiat: json['is_fiat'] as bool?,
      self_reported_circulating_supply:
          (json['self_reported_circulating_supply'] as num?)?.toDouble(),
      self_reported_market_cap:
          (json['self_reported_market_cap'] as num?)?.toDouble(),
      num_market_pairs: (json['num_market_pairs'] as num?)?.toDouble(),
      circulating_supply: (json['circulating_supply'] as num?)?.toDouble(),
      total_supply: (json['total_supply'] as num?)?.toDouble(),
      max_supply: (json['max_supply'] as num?)?.toDouble(),
      last_updated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
      date_added: json['date_added'] == null
          ? null
          : DateTime.parse(json['date_added'] as String),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      quote: (json['quote'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, QuoteModel.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$CryptoModelToJson(CryptoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'slug': instance.slug,
      'cmc_rank': instance.cmc_rank,
      'is_active': instance.is_active,
      'is_fiat': instance.is_fiat,
      'self_reported_circulating_supply':
          instance.self_reported_circulating_supply,
      'self_reported_market_cap': instance.self_reported_market_cap,
      'num_market_pairs': instance.num_market_pairs,
      'circulating_supply': instance.circulating_supply,
      'total_supply': instance.total_supply,
      'max_supply': instance.max_supply,
      'last_updated': instance.last_updated?.toIso8601String(),
      'date_added': instance.date_added?.toIso8601String(),
      'tags': instance.tags,
      'quote': instance.quote,
    };
