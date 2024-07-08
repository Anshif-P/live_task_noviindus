import 'package:flutter/material.dart';
import 'package:noviindus_live_task_/src/util/constance/colors.dart';
import 'package:noviindus_live_task_/src/util/constance/text_style.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool textVisibility;
  final FormFieldValidator validator;
  final bool isColorGrey;
  bool isNumberKeyboard;

  TextFieldWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.validator,
      this.textVisibility = false,
      this.isNumberKeyboard = false,
      this.isColorGrey = true});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        color: AppColor.backgroundColor,
        child: TextFormField(
          keyboardType: widget.isNumberKeyboard
              ? TextInputType.number
              : TextInputType.text,
          onEditingComplete: () {
            FocusScope.of(context).nextFocus();
          },
          validator: widget.validator,
          controller: widget.controller,
          decoration: InputDecoration(
            isDense: true,
            constraints: const BoxConstraints(maxHeight: 70, minHeight: 35),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10.0),
            ),
            prefixIcon: widget.isColorGrey
                ? null
                : const Icon(
                    Icons.search,
                    size: 25,
                    color: AppColor.grey,
                  ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            hintText: widget.hintText,
            hintStyle: AppText.mediumGrey,
          ),
        ),
      ),
    );
  }
}
