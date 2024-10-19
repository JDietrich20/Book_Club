import 'package:Book_Club/pages/main_page/cubit/main_page_cubit.dart';
import 'package:Book_Club/pages/views/book_view.dart';
import 'package:Book_Club/pages/views/initial_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageCubit(),
      child: BlocBuilder<MainPageCubit, MainPageState>(
        builder: (context, state) {
          print(state.runtimeType);
          switch (state.runtimeType) {
            case (MainPageInitial):
              return const InitialView();
            case (BookPage):
              return const BookView();
            default:
              return const InitialView();
          }
        },
      ),
    );
  }
}
