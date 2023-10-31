class FlashcardCategory {
  String title;
  List<Flashcard> flashcards;

  FlashcardCategory({
    required this.title,
    required this.flashcards,
  });
}

class Flashcard {
  String question;
  String answer;

  Flashcard({
    required this.question,
    required this.answer,
  });
}
