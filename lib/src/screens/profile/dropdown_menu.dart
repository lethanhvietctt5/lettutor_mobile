import 'package:flutter/material.dart';

class DropdownEdit extends StatelessWidget {
  const DropdownEdit({Key? key, required String title, required String selectedItem, required List<String> items})
      : _title = title,
        _selectedItem = selectedItem,
        _items = items,
        super(key: key);

  final String _title, _selectedItem;
  final List<String> _items;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 7, left: 5),
            child: Text(
              _title,
              style: const TextStyle(fontSize: 17),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26, width: 0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedItem,
                  style: const TextStyle(fontSize: 17),
                ),
                PopupMenuButton<String>(
                  offset: const Offset(0, 48),
                  icon: const Icon(Icons.arrow_drop_down),
                  itemBuilder: (context) => _items
                      .map((String item) => PopupMenuItem<String>(
                            child: Text(item),
                          ))
                      .toList(),
                  onSelected: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
