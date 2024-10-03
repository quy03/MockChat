import 'package:flutter/material.dart';

class ButtonCheckbox extends StatefulWidget {
  const ButtonCheckbox({
    super.key,
  });

  @override
  State<ButtonCheckbox> createState() => _ButtonCheckboxState();
}

class _ButtonCheckboxState extends State<ButtonCheckbox> {
  // kiểm tra nút checkbox
  // ignore: prefer_final_fields
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: _isChecked
              ? Theme.of(context).colorScheme.secondary
              : Colors.grey,
          width: 2,
        ),
        color: _isChecked
            ? Theme.of(context).colorScheme.secondary
            : Colors.transparent,
      ),
      child: _isChecked
          ? const Icon(
              Icons.check,
              size: 16,
              color: Colors.white,
            )
          : null,
    );
  }
}
