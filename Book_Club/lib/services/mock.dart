import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:uuid/v4.dart';

const List<String> colors = [
  "green",
  "red",
  "orange",
  "yellow",
  "blue",
  "pink",
  "cyan",
  "magenta",
  "coral",
  "brown"
];

class Mock {
  static String title() {
    return lorem(paragraphs: 1, words: 1).replaceAll(".", "");
  }

  static String author() {
    return lorem(paragraphs: 1, words: 1).replaceAll(".", "");
  }

  static String description() {
    return "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  }

  static String uid() {
    return const UuidV4().generate();
  }

  static String imageUrl({String? title, String? author}) {
    return 'jjjpng';
  }
}
