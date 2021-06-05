import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:indomic/ui/utils/utils.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.hint,
    this.onChanged,
    this.onTap,
  }) : super(key: key);

  final String hint;
  final Function(String value)? onChanged;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 14,
      ),
      onChanged: onChanged,
      onTap: onTap,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: greyDarkC,
          size: 20,
        ),
        hintText: "$hint",
        hintStyle: TextStyle(
          color: greyDarkC,
          fontSize: 13,
        ),
        contentPadding: EdgeInsets.only(
          top: defaultPadding * 0.5,
          left: defaultPadding / 2,
        ),
        fillColor: greyC,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(defaultRadius()),
        ),
      ),
    ).h(32).marginOnly(top: defaultMargin * 1.2);
  }
}
