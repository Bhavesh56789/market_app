class CryptoEntity {
  final int? id;
  final String? name;
  final String? symbol;
  final String? slug;
  final double? cmc_rank;
  final bool? is_active;
  final bool? is_fiat;
  final double? self_reported_circulating_supply;
  final double? self_reported_market_cap;
  final double? num_market_pairs;
  final double? circulating_supply;
  final double? total_supply;
  final double? max_supply;
  final DateTime? last_updated;
  final DateTime? date_added;
  final List<String>? tags;
  // final String? platform;
  final Map<String, QuoteEntity>? quote;

  CryptoEntity({
    this.circulating_supply,
    this.cmc_rank,
    this.date_added,
    this.id,
    this.is_active,
    this.is_fiat,
    this.last_updated,
    this.max_supply,
    this.name,
    this.num_market_pairs,
    this.quote,
    this.self_reported_circulating_supply,
    this.self_reported_market_cap,
    this.slug,
    this.symbol,
    this.tags,
    this.total_supply,
  });
}

class QuoteEntity {
  final double? price;
  final double? volume_24h;
  final double? percent_change_1h;
  final double? percent_change_24h;
  final double? percent_change_7d;
  final double? market_cap;
  final DateTime? last_updated;

  QuoteEntity({
    this.price,
    this.last_updated,
    this.market_cap,
    this.percent_change_1h,
    this.percent_change_24h,
    this.percent_change_7d,
    this.volume_24h,
  });
}
