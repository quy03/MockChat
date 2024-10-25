import 'package:flutter/material.dart';
import 'package:mock_chat/contants.dart';

class ColorProvider extends ChangeNotifier {
  // màu được chọn
  Color _selectedColor = kSecondaryColor;

  // màu không được chọn
  Color _unselectedColor = kInversePrimaryColor;

  // lấy giá trị màu
  Color get selectedColor => _selectedColor;
  Color get unselectedColor => _unselectedColor;

  void setSelectedColor(Color color) {
    _selectedColor = color;
    notifyListeners();
  }

  void setUnselectedColor(Color color) {
    _unselectedColor = color;
    notifyListeners();
  }
}
