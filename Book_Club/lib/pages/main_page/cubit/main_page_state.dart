part of 'main_page_cubit.dart';

@immutable
sealed class MainPageState {}

final class MainPageInitial extends MainPageState {}

class BookPage extends MainPageState {
  final Book book;

  BookPage(this.book);
}
