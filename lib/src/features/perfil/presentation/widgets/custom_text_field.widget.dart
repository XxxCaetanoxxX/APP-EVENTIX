import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String? initialValue;
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.focusNode,
    this.initialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    controller.text = initialValue!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        enabled: labelText != "CPF" ? true : false,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
