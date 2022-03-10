// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:textfield_search/textfield_search.dart';

class SearchBar extends StatelessWidget {
  final _searchController = TextEditingController();
  List dummyList = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextFieldSearch(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.circular(20.0)),
          ),
          initialList: dummyList,
          label: 'Search bar',
          controller: _searchController,
        ),
      ),
    );
  }
}
