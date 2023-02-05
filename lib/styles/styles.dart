import 'package:bereal/styles/colors.dart';
import 'package:flutter/material.dart';

@immutable
class AppStyle {
  final AppColors colors = AppColors();

  final _Text text = _Text();
  final _Button button = _Button();
}

@immutable
class _Text {
  TextStyle get titleFont => const TextStyle(fontFamily: 'Roboto');
  TextStyle get contentFont => const TextStyle(fontFamily: 'Roboto');

  late final TextStyle title = titleFont.copyWith(fontWeight: FontWeight.w700, fontSize: 30);

  late final TextStyle hint =
      titleFont.copyWith(fontWeight: FontWeight.w700, fontSize: 36, color: AppColors().toThemeData().hintColor);

  late final TextStyle hintSearchInput =
      titleFont.copyWith(fontWeight: FontWeight.w600, fontSize: 16, color: AppColors().toThemeData().hintColor);

  late final TextStyle body = contentFont.copyWith(fontWeight: FontWeight.w400, fontSize: 16);
  late final TextStyle bodyBold = contentFont.copyWith(fontWeight: FontWeight.w700, fontSize: 16);
  late final TextStyle bodySmall = contentFont.copyWith(fontWeight: FontWeight.w400, fontSize: 12);
  late final TextStyle bodySmallBold = contentFont.copyWith(fontWeight: FontWeight.w700, fontSize: 12);

  late final TextStyle countdown = contentFont.copyWith(fontWeight: FontWeight.w800, fontSize: 20);
  late final TextStyle countdownRed = countdown.copyWith(color: Colors.red[600]);

  late final TextStyle btn = contentFont.copyWith(fontWeight: FontWeight.w600, fontSize: 14);

  // Real texts
  late final TextStyle bodyReal = contentFont.copyWith(fontWeight: FontWeight.w600, fontSize: 14);
  late final TextStyle bodyRealSecondary = contentFont.copyWith(
      fontWeight: FontWeight.w400, fontSize: 12, color: AppColors().toThemeData().colorScheme.primary.withAlpha(100));
}

@immutable
class _Button {
  TextStyle get font => const TextStyle(fontFamily: 'Roboto');

  final ButtonStyle textBtn = ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(const EdgeInsets.all(0)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minimumSize: MaterialStateProperty.all<Size>(const Size(0, 0)),
      textStyle: MaterialStateProperty.resolveWith((_) => _Text().bodyBold),
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.focused) ||
              states.contains(MaterialState.pressed)) {
            return Colors.transparent;
          }
          return null; // Defer to the widget's default.
        },
      ),
      splashFactory: NoSplash.splashFactory);

  final ButtonStyle textBtnDisabled = ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textStyle: MaterialStateProperty.resolveWith((_) => _Text().bodyBold),
      foregroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states) => Colors.grey.shade800),
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.focused) ||
              states.contains(MaterialState.pressed)) {
            return Colors.transparent;
          }
          return null; // Defer to the widget's default.
        },
      ),
      splashFactory: NoSplash.splashFactory);

  final ButtonStyle primary = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      foregroundColor: AppColors().toThemeData().colorScheme.secondaryContainer,
      backgroundColor: AppColors().toThemeData().colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textStyle: _Text().btn);

  final ButtonStyle primaryLarge = ElevatedButton.styleFrom(
      foregroundColor: AppColors().toThemeData().colorScheme.secondaryContainer,
      backgroundColor: AppColors().toThemeData().colorScheme.primary,
      minimumSize: const Size.fromHeight(44),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      textStyle: _Text().btn);

  final ButtonStyle btnFlat = ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.focused) ||
              states.contains(MaterialState.pressed)) {
            return Colors.transparent;
          }
          return null; // Defer to the widget's default.
        },
      ),
      splashFactory: NoSplash.splashFactory);
}
