// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_import, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/declist_controller.dart';

class FlashcardView extends StatefulWidget {
  @override
  State<FlashcardView> createState() => _FlashcardViewState();
}

class _FlashcardViewState extends State<FlashcardView> {
  final FlashcardController controller = Get.put(FlashcardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
            onTap: () {
              controller.loadJsonData();
              print(controller.flashcardCategories.length);
            },
            child: Text('Flashcards')),
      ),
      body: Obx(() {
        return controller.flashcardCategories.isEmpty
            ? SizedBox()
            : GridView.builder(
                itemCount: controller.flashcardCategories.length,
                itemBuilder: (context, index) {
                  final category = controller.flashcardCategories[index];
                  return Container(
                    height: 100,
                    width: 100,
                    color: Colors.blueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          category.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
              );
      }),
    );
  }
}
