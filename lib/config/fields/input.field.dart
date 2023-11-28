import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../style.dart';

class InputFieldOne extends StatelessWidget {
  InputFieldOne({
    super.key,
    this.controller,
    this.onClick,
    this.style,
    this.onChanged,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly,
    this.keyboardType,
    this.obscureText,
  });

  final TextEditingController? controller;
  final void Function()? onClick;
  final void Function(String)? onChanged;
  final TextStyle? style;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: FieldStyle().decorationOne,
      child: TextField(
        style: style,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          alignLabelWithHint: true,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText ?? "Demo Text",
          hintStyle: hintStyle,
        ),
        onTap: onClick,
        onChanged: onChanged,
        readOnly: readOnly ?? false,
        obscureText: obscureText ?? false,
      ),
    );
  }
}

class InputSearchField extends StatelessWidget {
  InputSearchField({
    super.key,
    this.controller,
    this.onClick,
    this.style,
    this.onChanged,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly,
    this.keyboardType,
    this.obscureText,
  });

  final TextEditingController? controller;
  final void Function()? onClick;
  final void Function(String)? onChanged;
  final TextStyle? style;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      decoration: decorationSearch,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.sp),
        child: TextField(
          style: style,
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            alignLabelWithHint: true,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText ?? "Demo Text",
            hintStyle: hintStyle,
          ),
          onTap: onClick,
          onChanged: onChanged,
          readOnly: readOnly ?? false,
          // obscureText: obscureText ?? false,
        ),
      ),
    );
  }
}
