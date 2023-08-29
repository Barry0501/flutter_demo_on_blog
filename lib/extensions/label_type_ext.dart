import 'package:flutter/material.dart';

enum LabelType { warning, success, infor, error, primary }

extension LabelTypeExt on LabelType {
  Color textColor() {
    switch (this) {
      case LabelType.warning:
        return const Color(0xffF79009);
      case LabelType.success:
        return const Color(0xff12B76A);
      case LabelType.infor:
        return const Color(0xff2970FF);
      case LabelType.error:
        return const Color(0xffF04438);
      case LabelType.primary:
        return const Color(0xff840519);
    }
  }

  Color bgColor() {
    switch (this) {
      case LabelType.warning:
        return const Color(0xffFEF4E6);
      case LabelType.success:
        return const Color(0xffE7F8F0);
      case LabelType.infor:
        return const Color(0xffE9F0FF);
      case LabelType.error:
        return const Color(0xffFDECEB);
      case LabelType.primary:
        return const Color(0xffF2E6E8);
    }
  }
}
