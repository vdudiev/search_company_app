import 'package:flutter/material.dart';
import 'package:search_company/landing_page.dart';
import 'package:search_company/ui/app_di/app_scope.dart';

void main() async {
  var scope = AppScope();
  await scope.initApp();
  runApp(LandingPage(
    appScope: scope,
  ));
}
