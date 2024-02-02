import 'package:flutter/material.dart';
import 'package:search_company/domain/entity/error_config.dart';
import 'package:search_company/ui/common/basic_button.dart';

class CustomErrorWidget extends StatelessWidget {
  final ErrorConfig errorConfig;
  final VoidCallback onRefresh;
  const CustomErrorWidget({super.key, required this.errorConfig, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorConfig.title),
          const SizedBox(height: 10),
          Text(errorConfig.subtitle),
          const SizedBox(height: 20),
          BasicButton(onTap: onRefresh, title: 'Потворить')
        ],
      ),
    );
  }
}
