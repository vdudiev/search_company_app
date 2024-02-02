import 'package:search_company/api/data/company_data.dart';
import 'package:search_company/domain/entity/error_config.dart';
import 'package:search_company/ui/pages/home_page/home_page.dart';

/// States страницы [HomePage]
abstract class HomeState {
  final List<CompanyData> companiesList;

  HomeState({required this.companiesList});
}

class HomeInitState extends HomeState {
  HomeInitState() : super(companiesList: []);
}

class HomeEmptyState extends HomeState {
  HomeEmptyState() : super(companiesList: []);
}

class HomeLoadingState extends HomeState {
  HomeLoadingState({required super.companiesList});
}

class HomeErrorState extends HomeState {
  final ErrorConfig errorConfig;
  HomeErrorState({
    required super.companiesList,
    required this.errorConfig,
  });
}

class HomeLoadedState extends HomeState {
  HomeLoadedState({required super.companiesList});
}
