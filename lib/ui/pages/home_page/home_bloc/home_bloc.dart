import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_company/domain/mixin/error_config_from_exception.dart';
import 'package:search_company/ui/app_di/app_scope.dart';
import 'package:search_company/ui/pages/home_page/home_bloc/home_event.dart';
import 'package:search_company/ui/pages/home_page/home_bloc/home_state.dart';
import 'package:search_company/ui/pages/home_page/home_model.dart';

/// Di для [HomeBloc]
HomeBloc createHomeBloc(BuildContext context) {
  final appDependencies = context.read<IAppScope>();
  final homeModel = HomeModel(companiesRepository: appDependencies.repository.companiesRepository);
  return HomeBloc(homeModel: homeModel);
}

/// [Bloc]-класс для бизнесс-логики экрана [HomePage]
class HomeBloc extends Bloc<HomeEvent, HomeState> with ErrorConfigFromException {
  final TextEditingController _textEditingController = TextEditingController();
  late final HomeModel _homeModel;

  HomeBloc({required HomeModel homeModel}) : super(HomeInitState()) {
    _homeModel = homeModel;

    /// Обработка события поика компаний по ИНН [SearchEvent]
    on<SearchEvent>(_search);
  }

  /// Контроллер для ввода ИНН в [HomePage]
  TextEditingController get textEditingController => _textEditingController;

  FutureOr<void> _search(SearchEvent event, Emitter<HomeState> emit) async {
    if (state is! HomeLoadingState) {
      emit(HomeLoadingState(companiesList: _homeModel.companies));
      try {
        await _homeModel.getCompaniesById(id: _textEditingController.text);
        if (_homeModel.companies.isEmpty) {
          emit(HomeInitState());
        } else {
          emit(HomeLoadedState(companiesList: _homeModel.companies));
        }
      } on DioException catch (e) {
        emit(HomeErrorState(companiesList: _homeModel.companies, errorConfig: getErrorconf(e)));
      }
    }
  }
}
