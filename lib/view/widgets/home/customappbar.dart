import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  const CustomAppBar(
      {Key? key,
      required this.titleappbar,
      this.onPressedIcon,
      this.onPressedSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      //* search icon + search text // notification icon
      child: Row(children: [
        //? 1. search icon + search text  ==================================================
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: IconButton(
                    icon: const Icon(Icons.search), onPressed: onPressedSearch),
                hintText: titleappbar,
                hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  //! => remove edge color
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[200]),
          ),
        ),
        const SizedBox(width: 10),

        //? 2. notification icon ==================================================
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          width: 60,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
            onPressed: onPressedIcon,
            icon: Icon(
              Icons.notifications_active_outlined,
              size: 30,
              color: Colors.grey[600],
            ),
          ),
        ),
      ]),
    );
  }
}
