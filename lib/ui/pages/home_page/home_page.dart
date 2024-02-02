import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_company/ui/common/basic_button.dart';
import 'package:search_company/ui/common/custom_error_widget.dart';
import 'package:search_company/ui/pages/home_page/home_bloc/home_bloc.dart';
import 'package:search_company/ui/pages/home_page/home_bloc/home_event.dart';
import 'package:search_company/ui/pages/home_page/home_bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homebloc = createHomeBloc(context);
    return BlocProvider.value(
      value: homebloc,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextField(
                    controller: homebloc.textEditingController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
                    decoration: InputDecoration(
                        labelText: 'Введите ИНН',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
                const SizedBox(height: 10),
                BasicButton(onTap: () => homebloc.add(SearchEvent()), title: 'Поиск'),
                const SizedBox(height: 10),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoadingState) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is HomeErrorState) {
                      return CustomErrorWidget(
                        errorConfig: state.errorConfig,
                        onRefresh: () => homebloc.add(SearchEvent()),
                      );
                    }
                    if (state is HomeEmptyState || state is HomeInitState) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text('Пусто'),
                      );
                    }
                    return Expanded(
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          Text(state.companiesList.first.unrestrictedValue, textAlign: TextAlign.center),
                          const SizedBox(height: 10),
                          Text(
                            state.companiesList.first.data.address.unrestrictedValue,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Text('ОГРН - ${state.companiesList.first.data.ogrn}', textAlign: TextAlign.center),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
