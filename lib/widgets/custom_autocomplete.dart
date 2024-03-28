import 'package:flutter/material.dart';

class CustomAutocomplete extends StatefulWidget {
  final List<String> suggestions;
  final ValueChanged<List<String>> onSelected;

  CustomAutocomplete({
    required this.suggestions,
    required this.onSelected,
  });

  @override
  _CustomAutocompleteState createState() => _CustomAutocompleteState();
}

class _CustomAutocompleteState extends State<CustomAutocomplete> {
  late TextEditingController _textEditingController;
  List<String> _selectedItems = [];
  List<String> _filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _textEditingController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final inputText = _textEditingController.text.toLowerCase();
    setState(() {
      if (inputText.isNotEmpty) {
        _filteredSuggestions = widget.suggestions
            .where((suggestion) => suggestion.toLowerCase().contains(inputText))
            .toList();
      } else {
        _filteredSuggestions = [];
      }
    });
  }

  void _onSuggestionSelected(String suggestion) {
    // Check if the suggestion is already in _selectedItems
    if (!_selectedItems.contains(suggestion)) {
      setState(() {
        _selectedItems.add(suggestion);
        widget.onSelected(_selectedItems.toList());
      });
    }
  }

  void _removeSelectedItem(String selectedItem) {
    setState(() {
      _selectedItems.remove(selectedItem);
      widget.onSelected(_selectedItems.toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: _selectedItems
                    .map(
                      (selectedItem) => Chip(
                    label: Text(selectedItem),
                    onDeleted: () => _removeSelectedItem(selectedItem),
                  ),
                )
                    .toList(),
              ),
              TextFormField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 0,
                          color: Colors.white),
                      borderRadius:
                      BorderRadius.circular(3.0)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0,
                        color: Colors.white),
                    borderRadius:
                    BorderRadius.circular(3.0),
                  ),
                  hintText: 'Search',
                  contentPadding: EdgeInsets.all(5),
                  hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Arial'),
                  labelStyle: TextStyle(color: Colors.grey, fontFamily: 'Arial'),
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
        if (_filteredSuggestions.isNotEmpty)
          Container(
            height: 200, // Set the height of the suggestion list
            child: Scrollbar(
              thumbVisibility:true,
              child: ListView.builder(
                itemCount: _filteredSuggestions.length,
                itemBuilder: (context, index) {
                  final suggestion = _filteredSuggestions[index];
                  return InkWell(
                    onTap: () => _onSuggestionSelected(suggestion),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Container(
                        // decoration: BoxDecoration(
                        //   border: Border(
                        //     bottom: BorderSide(color: Colors.grey.shade300),
                        //   ),
                        // ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                          title: Text(
                            suggestion,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        if (_filteredSuggestions.isEmpty && _textEditingController.text.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              'Item not found',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
      ],
    );
  }
}
