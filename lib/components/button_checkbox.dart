import 'package:flutter/material.dart';

class ButtonCheckbox extends StatefulWidget {
  const ButtonCheckbox({
    super.key,
  });

  @override
  State<ButtonCheckbox> createState() => _ButtonCheckboxState();
}

class _ButtonCheckboxState extends State<ButtonCheckbox> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isChecked = !_isChecked;
            });
          },
          child: Container(
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
          ),
        ),
        const SizedBox(width: 8),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: "Tôi đồng ý với ",
                style: TextStyle(color: Color.fromRGBO(57, 57, 57, 1)),
              ),
              TextSpan(
                text: "chính sách",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text: ' và ',
                style: TextStyle(color: Color.fromRGBO(57, 57, 57, 1)),
              ),
              TextSpan(
                text: 'điều khoản',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
