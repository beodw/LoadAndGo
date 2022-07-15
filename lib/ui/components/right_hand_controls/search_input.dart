import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 55,
                child: Row(children: const [
                  Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.grey,
                  ),
                  Text('Filter', style: TextStyle(fontSize: 11)),
                ]),
              ),
              const Text(
                '15/12/2021, Unassigned',
                style: TextStyle(fontSize: 11),
              ),
            ],
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
