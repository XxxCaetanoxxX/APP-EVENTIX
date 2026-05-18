import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final String? initialValue;
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormFieldWidget({
    super.key,
    required this.labelText,
    required this.controller,
    required this.focusNode,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    if (initialValue != null && controller.text.isEmpty) {
      if (inputFormatters != null &&
          inputFormatters!.isNotEmpty &&
          inputFormatters!.first is MaskTextInputFormatter) {
        controller.text = (inputFormatters!.first as MaskTextInputFormatter)
            .maskText(initialValue!);
      } else {
        controller.text = initialValue!;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        enabled: labelText != "CPF" ? true : false,
        validator: validator,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          alignLabelWithHint: true,
          fillColor: Color(0xFFF8F9FF),
          filled: true,
        ),
      ),
    );
  }
}
