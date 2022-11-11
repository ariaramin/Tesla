import 'dart:ui';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

final Color blueGrey = HexColor("#F2F5F8");
final Color grey = HexColor("#979797");
final Color greyLight = HexColor("#A4B0BC");
final Color red = HexColor("#D01000");

String setPrice(int value) {
  var formatter = NumberFormat('#,##,000');
  return r"$" + formatter.format(value);
}
