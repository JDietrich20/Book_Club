import 'package:Book_Club/pages/model/book.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageInitial());

  Book? selectedBook;

  void viewBook(Book book) {
    selectedBook = book;
    emit(BookPage(
        book)); // Pass the selected book when emitting the BookPage state
  }

  void backMain() {
    emit(MainPageInitial());
  }
}
