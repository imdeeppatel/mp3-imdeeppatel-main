// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/flashcard_model.dart';

class FlashcardController extends GetxController {
  final flashcardCategories = <FlashcardCategory>[].obs;

  // Load JSON data and populate the observable list

  Future<void> loadJsonData() async {
    try {
      final String response =
          await rootBundle.loadString('assets/flashcards.json');
      final List<dynamic> jsonData = json.decode(response);

      flashcardCategories.assignAll(jsonData.map((categoryData) {
        final title = categoryData['title'] as String;
        final flashcardsData = categoryData['flashcards'] as List;
        final flashcards = flashcardsData
            .map((flashcardData) => Flashcard(
                  question: flashcardData['question'] as String,
                  answer: flashcardData['answer'] as String,
                ))
            .toList();

        return FlashcardCategory(title: title, flashcards: flashcards);
      }).toList());
    } catch (e) {
      print('Error loading JSON data: $e');
    }
  }
}
