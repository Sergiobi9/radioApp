import 'package:flutter/material.dart';

class SearchComponent extends StatefulWidget {
  Function(String value) onChanged;
  SearchComponent({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
        ),
        focusColor: Colors.black,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50.0)),
        hintText: "Search radio station",
        contentPadding: const EdgeInsets.all(15),
        filled: true,
        fillColor: const Color(0xffF5F5F5),
      ),
      onChanged: (value) {
        widget.onChanged(value);
      },
    );
  }
}
