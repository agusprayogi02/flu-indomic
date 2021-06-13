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
    this.controller,
    this.onEditingComplete,
    this.disabled = true,
    this.onFieldSubmitted,
  }) : super(key: key);

  final String hint;
  final Function(String value)? onChanged;
  final Function()? onTap;
  final TextEditingController? controller;
  final Function()? onEditingComplete;
  final bool disabled;
  final Function(String x)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 16,
        color: darkPrimaryC,
      ),
      onChanged: onChanged,
      onTap: onTap,
      controller: controller,
      enabled: disabled,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: primaryC,
          size: 24,
        ),
        hintText: "$hint",
        hintStyle: TextStyle(
          color: primaryC,
          fontSize: 16,
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
    ).h(35).marginOnly(top: defaultMargin * 0.3);
  }
}
