import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  CustomFormField(
      {super.key,
      required this.hintText,
      required this.icon,
      this.obscureText = false,
      required this.textInputType,
      required this.controller,
      this.visible = false,
      required this.validator,
      required this.labelText});
  final String hintText;
  final IconData icon;
  bool obscureText;
  final String? Function(String? value) validator;
  final TextInputType textInputType;
  final TextEditingController controller;
  bool visible;
  final String labelText;
  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.obscureText,
      keyboardType: widget.textInputType,
      style: TextStyle(
        fontSize: 20,
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: (widget.icon == Icons.lock ||
                widget.icon == Icons.lock_open)
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.visible = !widget.visible;
                    widget.obscureText = !widget.obscureText;
                  });
                },
                icon: widget.visible ? Icon(Icons.lock_open) : Icon(Icons.lock),
              )
            : Icon(widget.icon),
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
