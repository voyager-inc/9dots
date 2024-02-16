import 'package:flutter/material.dart';
import 'package:ninedots/core/di/di_container.dart';
import 'package:ninedots/core/utils/device_configs.dart';

extension NumberExtension on num {
  double get resize => locator<DeviceConfigs>().resizeFitDevice(toDouble());
  double get repoint => locator<DeviceConfigs>().resizePoint(toDouble());

  EdgeInsetsGeometry get horizontalPadding => EdgeInsets.symmetric(horizontal: resize);
  EdgeInsetsGeometry get verticalPadding => EdgeInsets.symmetric(vertical: resize);
  EdgeInsetsGeometry get allPadding => EdgeInsets.all(resize);
  EdgeInsetsGeometry get topPadding => EdgeInsets.only(top: resize);
  EdgeInsetsGeometry get bottomPadding => EdgeInsets.only(bottom: resize);
  EdgeInsetsGeometry get leftPadding => EdgeInsets.only(left: resize);
  EdgeInsetsGeometry get rightPadding => EdgeInsets.only(right: resize);
}

extension ListNumberExtension on List<num> {
  EdgeInsetsGeometry _lTRBPadding(left, top, right, bottom) => EdgeInsets.only(
    left: left,
    top: top,
    right: right,
    bottom: bottom,
  );

  EdgeInsetsGeometry _symmetricPadding(hor, vert) => EdgeInsets.symmetric(
    horizontal: hor,
    vertical: vert,
  );

  EdgeInsetsGeometry get padding {
    if (length == 0) return EdgeInsets.zero;
    if (length == 1) return first.allPadding;
    if (length == 2) return _symmetricPadding(this[0].resize, this[1].resize);
    if (length == 3) {
      return _lTRBPadding(this[0].resize, this[1].resize, this[2].resize, 0);
    }
    return _lTRBPadding(
      this[0].resize,
      this[1].resize,
      this[2].resize,
      this[3].resize,
    );
  }
}

extension StringExtension on String {
  Text _commonText({
    TextAlign align = TextAlign.left,
    int? lines,
    TextOverflow? overflow,
  }) => Text(
      this,
      textAlign: align,
      softWrap: true,
      maxLines: lines,
      overflow: overflow,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontFamily: "Roboto-Regular",
        decoration: TextDecoration.none,
      )
  );


  Text textCustom({
    TextAlign align = TextAlign.left,
    int? lines,
    TextOverflow? overflow,
  }) => _commonText(align: align, lines: lines, overflow: overflow);

  Text get text => _commonText();
  Text get center => _commonText(align: TextAlign.center);
  Text get centerALine => _commonText(align: TextAlign.center, lines: 1);
  Text get ellipsis => _commonText(overflow: TextOverflow.ellipsis);
  Text get ellipsisALine => _commonText(overflow: TextOverflow.ellipsis, lines: 1);
}

extension TextExtension on Text {
  TextStyle get style => this.style ?? const TextStyle();

  Text get regular => Text(data ?? "", style: style.copyWith(fontFamily: "Roboto-Regular"));
  Text get black => Text(data ?? "", style: style.copyWith(fontFamily: "Roboto-Black"));
  Text get blackItalic => Text(data ?? "", style: style.copyWith(fontFamily: "Roboto-BlackItalic"));
  Text get bold => Text(data ?? "", style: style.copyWith(fontFamily: "Roboto-Bold"));
  Text get boldItalic => Text(data ?? "", style: style.copyWith(fontFamily: "Roboto-BoldItalic"));
  Text get italic => Text(data ?? "", style: style.copyWith(fontFamily: "Roboto-Italic"));
  Text get light => Text(data ?? "", style: style.copyWith(fontFamily: "Roboto-Light"));
  Text get lightItalic => Text(data ?? "", style: style.copyWith(fontFamily: "Roboto-LightItalic"));
  Text get medium => Text(data ?? "", style: style.copyWith(fontFamily: "Roboto-Medium"));
  Text get mediumItalic => Text(data ?? "", style: style.copyWith(fontFamily: "Roboto-MediumItalic"));
  Text get thin => Text(data ?? "", style: style.copyWith(fontFamily: "Roboto-Thin"));
  Text get thinItalic => Text(data ?? "", style: style.copyWith(fontFamily: "Roboto-ThinItalic"));

  Text s(double size) => Text(data ?? "", style: style.copyWith(fontSize: size.resize));
  Text get s10 => s(10);
  Text get s14 => s(14);
  Text get s15 => s(15);
  Text get s18 => s(18);
  Text get s20 => s(20);
  Text get s24 => s(24);
  Text get s25 => s(25);
  Text get s28 => s(28);
  Text get s30 => s(30);
  Text get s32 => s(32);
  Text get s36 => s(36);
  Text get s40 => s(40);
  Text get s48 => s(48);
  Text get s50 => s(50);
  Text get s60 => s(60);
  Text get s70 => s(70);
  Text get s80 => s(80);
  Text get s90 => s(90);
  Text get s100 => s(100);

  Text c(Color color) => Text(data ?? "", style: style.copyWith(color: color));
}

extension TextStyleExtension on TextStyle {
  TextStyle get regular => copyWith(fontFamily: "Roboto-Regular");
  TextStyle get black => copyWith(fontFamily: "Roboto-Black");
  TextStyle get blackItalic => copyWith(fontFamily: "Roboto-BlackItalic");
  TextStyle get bold => copyWith(fontFamily: "Roboto-Bold");
  TextStyle get boldItalic => copyWith(fontFamily: "Roboto-BoldItalic");
  TextStyle get italic => copyWith(fontFamily: "Roboto-Italic");
  TextStyle get light => copyWith(fontFamily: "Roboto-Light");
  TextStyle get lightItalic => copyWith(fontFamily: "Roboto-LightItalic");
  TextStyle get medium => copyWith(fontFamily: "Roboto-Medium");
  TextStyle get mediumItalic => copyWith(fontFamily: "Roboto-MediumItalic");
  TextStyle get thin => copyWith(fontFamily: "Roboto-Thin");
  TextStyle get thinItalic => copyWith(fontFamily: "Roboto-ThinItalic");

  TextStyle s(double size) => copyWith(fontSize: size.resize);
  TextStyle get s10 => s(10);
  TextStyle get s14 => s(14);
  TextStyle get s15 => s(15);
  TextStyle get s18 => s(18);
  TextStyle get s20 => s(20);
  TextStyle get s24 => s(24);
  TextStyle get s25 => s(25);
  TextStyle get s28 => s(28);
  TextStyle get s30 => s(30);
  TextStyle get s32 => s(32);
  TextStyle get s36 => s(36);
  TextStyle get s40 => s(40);
  TextStyle get s48 => s(48);
  TextStyle get s50 => s(50);
  TextStyle get s60 => s(60);
  TextStyle get s70 => s(70);
  TextStyle get s80 => s(80);
  TextStyle get s90 => s(90);
  TextStyle get s100 => s(100);

  TextStyle c(Color color) => copyWith(color: color);

  TextStyle get u => copyWith(decoration: TextDecoration.underline);
}