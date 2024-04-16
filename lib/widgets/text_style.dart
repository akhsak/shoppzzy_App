import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textPoppins({name, color, fontweight, double? fontsize}) {
  return Text(name!,
      style: GoogleFonts.poppins(
          color: color, fontWeight: fontweight, fontSize: fontsize));
}

Widget textAbel({name, color, fontweight, double? fontsize}) {
  return Text(name,
      style: GoogleFonts.abel(
          color: color, fontWeight: fontweight, fontSize: fontsize));
}