import 'package:flutter/material.dart';

class ItemNote extends StatelessWidget {
  const ItemNote({
    super.key,
    this.onTapMenu,
  });

  final Function()? onTapMenu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
        left: 14,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(),
                _content(),
              ],
            ),
          ),
          IconButton(
            onPressed: onTapMenu,
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Text(
      "Lorem ipsum",
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _content() {
    return Text(
      "Lorem ipsum dolor sit amit",
      style: TextStyle(
        color: Colors.black87,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
