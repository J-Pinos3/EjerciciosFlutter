
import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomTextFormFields extends StatelessWidget {

  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscure;

  final Function(String)? onChanged;
  final String? Function(String?)? onValidator;

  const CustomTextFormFields({
    super.key,
    this.label, 
    this.hint, 
    this.errorMessage, 
    this.obscure =false,
    this.onChanged, 
    this.onValidator
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      //borderSide: BorderSide(color: colors.tertiary),
      borderRadius: BorderRadius.circular(50)
    );

    return TextFormField(
      onChanged: onChanged,

      validator: onValidator,

      obscureText: obscure ,

      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder: border.copyWith(borderSide: BorderSide(color:Colors.red.shade800)),
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color:Colors.red.shade800)),

        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.black38),
        focusColor: colors.primary,
        errorText: errorMessage
        
      ),
    );
  }
}