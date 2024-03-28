import 'package:flutter/material.dart';

class CustomAutocomplete extends StatefulWidget {
  final List<String> suggestions;
  final Function(List<String>) onSelected;
  List<String> selectedItems = [];

  CustomAutocomplete({required this.suggestions, required this.onSelected});

  @override
  _CustomAutocompleteState createState() => _CustomAutocompleteState();
}

class _CustomAutocompleteState extends State<CustomAutocomplete> {
  late TextEditingController _textEditingController;
  List<String> filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    filteredSuggestions = widget.suggestions;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _textEditingController,
          onChanged: onTextChanged,
          decoration: InputDecoration(
            hintText: 'Search',
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(),
          ),
        ),
        if (_textEditingController.text.length >= 3 && filteredSuggestions.isNotEmpty)
          Container(
            height: 200, // Set a fixed height for the suggestions list
            child: ListView.builder(
              itemCount: filteredSuggestions.length,
              itemBuilder: (BuildContext context, int index) {
                final suggestion = filteredSuggestions[index];
                final isSelected = widget.selectedItems.contains(suggestion);

                return ListTile(
                  title: Text(suggestion),
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        widget.selectedItems.remove(suggestion);
                      } else {
                        widget.selectedItems.add(suggestion);
                      }
                    });
                    widget.onSelected(widget.selectedItems);
                    print("Selected items : ${widget.selectedItems}");
                  },
                  selected: isSelected,
                  tileColor: isSelected ? Colors.blue.withOpacity(0.2) : null,
                );
              },
            ),
          ),
      ],
    );
  }

  void onTextChanged(String value) {
    setState(() {
      if (value.length >= 3) {
        filteredSuggestions = widget.suggestions
            .where((suggestion) =>
            suggestion.toLowerCase().contains(value.toLowerCase()))
            .toList();
      } else {
        filteredSuggestions = widget.suggestions;
      }
    });
  }
}
