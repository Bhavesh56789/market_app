import 'package:flutter/material.dart';
import 'package:market_app/domain/entities/crypto_entity.dart';

class VerticalTabWidget extends StatefulWidget {
  final List<CryptoEntity> items;

  const VerticalTabWidget({super.key, required this.items});

  @override
  State<VerticalTabWidget> createState() => _VerticalTabWidgetState();
}

class _VerticalTabWidgetState extends State<VerticalTabWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ValueNotifier selectedIndex = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTab(String text, int index) {
    return GestureDetector(
      onTap: () {
        _tabController.animateTo(index);
        selectedIndex.value = index;
      },
      child: Container(
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: index == selectedIndex.value ? Colors.white : null,
          border: Border.all(color: Colors.white),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color:
                  index == selectedIndex.value ? Colors.black : Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Today\'s List',
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
          height: 30,
          child: ValueListenableBuilder(
            valueListenable: selectedIndex,
            builder: (context, value, _) {
              return ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  _buildTab('Top Hot', 0),
                  const SizedBox(
                    width: 8,
                  ),
                  _buildTab('Top Loosers', 1),
                  const SizedBox(
                    width: 8,
                  ),
                  _buildTab('Volume', 2),
                  const SizedBox(
                    width: 8,
                  ),
                  _buildTab('Market', 3),
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              VerticalListViewWidget(items: widget.items),
              VerticalListViewWidget(items: widget.items),
              VerticalListViewWidget(items: widget.items),
              VerticalListViewWidget(items: widget.items),
            ],
          ),
        ),
      ],
    );
  }
}

class VerticalListViewWidget extends StatelessWidget {
  final List<CryptoEntity> items;

  const VerticalListViewWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(
            'assets/bitcoin-logo-svgrepo-com.png',
            height: 25,
          ),
          title: Text(
            items[index].name ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          subtitle: Text(
            items[index].symbol ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${items[index].quote?['USD']?.price?.toStringAsFixed(2) ?? ''}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  items[index].quote?['USD']?.percent_change_24h?.isNegative ??
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
                            : Colors.green),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
