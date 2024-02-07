import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utill/colors.dart';
import 'app_touchable.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onTap,
    final Key? key,
    this.text,
    this.disabled = false,
    this.enabled = true,
    this.loading = false,
    this.color,
    this.textColor,
    this.padding,
    this.fontSize,
    this.builder,
    this.borderRadius,
  })  : assert(text != null || builder != null,
            'Either text or builder must be passed'),
        super(key: key);

  final void Function() onTap;
  final String? text;
  final Widget Function(BuildContext, TextStyle)? builder;
  final bool disabled; // changes background to grey
  final bool enabled; // Just disables click
  final bool loading;
  final Color? color;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final BorderRadius? borderRadius;

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: (disabled || loading)
            ? theme.disabledColor
            : (color ?? theme.primaryColor),
        gradient: ((disabled || loading) ? theme.disabledColor : color) == null
            ? CC.themeGradient
            : null,
        borderRadius: borderRadius ?? BorderRadius.circular(25.sp),
      ),
      child: AppTouchable(
        onTap: !disabled && enabled && !loading ? onTap : null,
        borderRadius: borderRadius ?? BorderRadius.circular(25.sp),
        child: Padding(
          padding: padding ??
              EdgeInsets.symmetric(horizontal: 42.sp, vertical: 16.sp),
          child: Center(
            child: loading
                ? SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: theme.primaryColorDark,
                      strokeWidth: 2,
                    ),
                  )
                : builder != null
                    ? builder!(
                        context,
                        TextStyle(
                          color: disabled || loading
                              ? Colors.white
                              : textColor ?? Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: (fontSize ?? 16).sp,
                          fontFamily: 'Poppins',

                        ),
                      )
                    : Text(
                        maxLines: 1,
                        text!,
                        style: TextStyle(
                          color: disabled || loading
                              ? Colors.white
                              : textColor ?? Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: (fontSize ?? 16).sp,
                          fontFamily: 'Poppins',

                        ),
                      ),
          ),
        ),
      ),
    );
  }
}

class AppButtonSmall extends StatelessWidget {
  const AppButtonSmall({
    required this.onTap,
    final Key? key,
    this.text,
    this.disabled = false,
    this.enabled = true,
    this.loading = false,
    this.color,
    this.textColor,
    this.padding,
    this.fontSize,
    this.builder,
    this.borderRadius,
  })  : assert(text != null || builder != null,
            'Either text or builder must be passed'),
        super(key: key);

  final void Function() onTap;
  final String? text;
  final Widget Function(BuildContext, TextStyle)? builder;
  final bool disabled; // changes background to grey
  final bool enabled; // Just disables click
  final bool loading;
  final Color? color;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final BorderRadius? borderRadius;

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: (disabled || loading)
            ? theme.disabledColor
            : (color ?? theme.primaryColor),
        gradient: ((disabled || loading) ? theme.disabledColor : color) == null
            ? CC.themeGradient
            : null,
        borderRadius: borderRadius ?? BorderRadius.circular(12.sp),
      ),
      child: AppTouchable(
        onTap: !disabled && enabled && !loading ? onTap : null,
        borderRadius: borderRadius ?? BorderRadius.circular(12.sp),
        child: Padding(
          padding: padding ??
              EdgeInsets.symmetric(horizontal: 14, vertical: 14.sp),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Center(
              child: loading
                  ? SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        color: theme.primaryColorDark,
                        strokeWidth: 2,
                      ),
                    )
                  : builder != null
                      ? builder!(
                          context,
                          TextStyle(
                            color: disabled || loading
                                ? Colors.white
                                : textColor ?? Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: (fontSize ?? 16).sp,
                          ),
                        )
                      : Text(
                          text!,
                          style: TextStyle(
                            color: disabled || loading
                                ? Colors.white
                                : textColor ?? Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: (fontSize ?? 16).sp,
                          ),
                        ),
            ),
          ),
        ),
      ),
    );
  }
}

class OutlineAppButton extends StatelessWidget {
  const OutlineAppButton({
    required this.onTap,
    final Key? key,
    this.text,
    this.disabled = false,
    this.enabled = true,
    this.loading = false,
    this.color,
    this.textColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 70, vertical: 12),
    this.fontSize,
    this.builder,
  })  : assert(text != null || builder != null,
            'Either text or builder must be passed'),
        super(key: key);

  final void Function() onTap;
  final String? text;
  final Widget Function(BuildContext, TextStyle)? builder;
  final bool disabled; // changes background to grey
  final bool enabled; // Just disables click
  final bool loading;
  final Color? color;
  final Color? textColor;
  final EdgeInsetsGeometry padding;
  final double? fontSize;

  @override
  Widget build(final BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: disabled || loading
                ? theme.disabledColor
                : color ?? theme.primaryColor,
            width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: AppTouchable(
        onTap: !disabled && enabled && !loading ? onTap : null,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: padding,
          child: Center(
            child: loading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : builder != null
                    ? builder!(
                        context,
                        TextStyle(
                          color: disabled || loading
                              ? theme.disabledColor
                              : color ?? theme.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: fontSize ?? 18,
                        ),
                      )
                    : Text(
                        text!,
                        style: TextStyle(
                          color: disabled || loading
                              ? theme.disabledColor
                              : color ?? theme.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: fontSize ?? 18,
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
