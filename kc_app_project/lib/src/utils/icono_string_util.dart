import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'search': Icons.search,
  'photo_library_outlined': Icons.photo_library_outlined,
  'school_outlined': Icons.school_outlined,
};

Icon getIcon(String nombreIcono) {
  return Icon(
    _icons[nombreIcono],
    color: Colors.black,
  );
}
