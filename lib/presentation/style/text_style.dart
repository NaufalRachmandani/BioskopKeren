import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appTitle({required ColorScheme colorScheme}) {
  return GoogleFonts.nunitoSans(
      fontSize: 26,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      color: colorScheme.onPrimary
  );
}

TextStyle headline1({required ColorScheme colorScheme}) {
  return GoogleFonts.nunitoSans(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      color: colorScheme.onPrimary
  );
}

TextStyle headline2({required ColorScheme colorScheme}) {
  return GoogleFonts.nunitoSans(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: colorScheme.onPrimary
  );
}

TextStyle title1({required ColorScheme colorScheme}) {
  return GoogleFonts.nunitoSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: colorScheme.onPrimary
  );
}

TextStyle subtitle1({required ColorScheme colorScheme}) {
  return GoogleFonts.nunitoSans(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: colorScheme.onPrimary
  );
}
