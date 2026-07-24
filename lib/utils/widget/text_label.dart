import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:apps_food/utils/utility.dart';

class TextLabell extends StatelessWidget {
  final text, color, weight, align;
  final size;

  const TextLabell({
    super.key,
    required this.text,
    this.color,
    this.weight,
    this.size,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        fontSize: double.parse(size != null ? size.toString() : '12.0'),
        color: color ?? Utility.black,
        fontWeight: weight ?? FontWeight.w400,
      ),
      textAlign: align ?? TextAlign.left,
    );
  }
}
