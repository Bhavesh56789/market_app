import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_app/presentation/controllers/home_controller.dart';
import 'package:market_app/presentation/widgets/horizontal_list_widget.dart';
import 'package:market_app/presentation/widgets/vertical_tab_widget.dart';

class CryptoPage extends StatelessWidget {
  CryptoPage({super.key});
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Discover',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              children: [
                HorizontalListWidget(items: controller.trendingCryptoList),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: VerticalTabWidget(items: controller.latestCryptoList),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
