import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:autocomplete_func/widgets/custom_autocomplete.dart';

class GetXHomePage extends StatelessWidget {
  final List<String> suggestions = [
    'Apple',
    'Banana',
    'Orange',
    'Pineapple',
    'Strawberry',
  ];

  final RxList<String> selectedValues = <String>[].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getx Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select fruits:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              CustomAutocomplete(
                suggestions: suggestions,
                onSelected: (selectedItems) {
                  selectedValues.assignAll(selectedItems);
                },
              ),
              SizedBox(height: 20),
              Obx(() => Text(
                'Selected Values: ${selectedValues.join(', ')}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
