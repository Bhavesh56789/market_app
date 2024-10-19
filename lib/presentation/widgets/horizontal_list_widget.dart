import 'package:flutter/material.dart';
import '../../domain/entities/crypto_entity.dart';

class HorizontalListWidget extends StatelessWidget {
  final List<CryptoEntity> items;

  const HorizontalListWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Trending',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 118,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/bitcoin-logo-svgrepo-com.png',
                      height: 25,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      items[index].symbol ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        items[index]
                                    .quote?['USD']
                                    ?.percent_change_24h
                                    ?.isNegative ??
                                false
                            ? const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.red,
                                size: 24,
                              )
                            : const Icon(
                                Icons.arrow_drop_up,
                                color: Colors.green,
                                size: 24,
                              ),
                        Text(
                          '${items[index].quote?['USD']?.percent_change_24h?.toStringAsFixed(2) ?? ''}%',
                          style: TextStyle(
                            color: items[index]
                                        .quote?['USD']
                                        ?.percent_change_24h
                                        ?.isNegative ??
                                    false
                                ? Colors.red
                                : Colors.green,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '\$ ${items[index].quote?['USD']?.price?.toStringAsFixed(2) ?? ''}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
          ),
        ),
      ],
    );
  }
}
