import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_company/ui/app_di/app_scope.dart';
import 'package:search_company/ui/pages/home_page/home_page.dart';

class LandingPage extends StatelessWidget {
  final IAppScope appScope;

  const LandingPage({super.key, required this.appScope});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Provider<IAppScope>.value(
      value: appScope,
      child: const HomePage(),
    ));
  }
}
