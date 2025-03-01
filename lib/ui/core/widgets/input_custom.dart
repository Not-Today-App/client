import 'package:client/ui/core/themes/sizes.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.maxLength,
    this.maxLines = 1,
    this.isPassword = false,
    this.trailingIcon,
    this.errorText,
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final String? hint;
  final int? maxLength;
  final int maxLines;
  final bool isPassword;
  final IconData? trailingIcon;
  final String? errorText;
  final String? Function(String?)? validator;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      maxLength: widget.maxLength,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true, // Enable filling the background
        fillColor: Theme.of(context)
            .colorScheme
            .surfaceContainerHighest, // Set the background color
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.p16,
          vertical: AppSizes.p8,
        ),
        labelText: widget.label,
        hintText: widget.hint,
        errorText: widget.errorText,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : (widget.trailingIcon != null ? Icon(widget.trailingIcon) : null),
      ),
    );
  }
}
