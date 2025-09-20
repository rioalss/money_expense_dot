import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_expense_dot/shared/utils/extension/double_extension.dart';
import 'package:money_expense_dot/themes/app_color.dart';
import 'package:money_expense_dot/themes/typography.dart';

class Input extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? label;
  final String? hint;
  final String? errorText;
  final bool passwordField;
  final bool disabled;
  final bool filled;
  final bool autoFocus;
  final InputDecoration? decoration;
  final TextInputType keyboardType;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final VoidCallback? onTap;
  final ValueChanged<String?>? onChanged;
  final int? maxLines;
  final TextCapitalization? textCapitalization;
  final double borderRadius;
  final EdgeInsets? padding;
  final double? hintFontSize;
  final FontWeight? hintFontWeight;
  final FormFieldValidator<String>? validator;
  final Color? textColor;
  final double? height;
  final int? maxLength;
  final bool border;
  final bool? obscureText;
  final Color? hintColor;
  final Color? cursorColor;
  final Color? borderColor;
  final Color? borderColorError;
  final double? suffixMaxheight;
  final Clip? clipBehavior;
  final TextAlign? textAlign;
  final BorderRadius? borderRadiusType;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String value)? onFieldSubmitted;
  final TextStyle? labelStyle;
  final String? obscuringCharacter;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;

  const Input(
      {super.key,
      this.controller,
      this.label,
      this.readOnly = false,
      this.focusNode,
      this.border = true,
      this.filled = false,
      this.initialValue,
      this.passwordField = false,
      this.disabled = false,
      this.autoFocus = false,
      this.decoration,
      this.onTap,
      this.keyboardType = TextInputType.text,
      this.suffixWidget,
      this.prefixWidget,
      this.maxLines,
      this.textCapitalization,
      this.borderRadius = 6,
      this.padding,
      this.hintFontSize,
      this.hintFontWeight,
      this.validator,
      this.onChanged,
      this.textColor,
      this.obscureText,
      this.hint,
      this.suffixMaxheight,
      this.height,
      this.errorText,
      this.borderRadiusType,
      this.clipBehavior,
      this.textAlign,
      this.cursorColor,
      this.hintColor,
      this.borderColor,
      this.maxLength,
      this.borderColorError,
      this.autovalidateMode,
      this.textInputAction,
      this.onFieldSubmitted,
      this.labelStyle,
      this.obscuringCharacter,
      this.inputFormatters});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  late FocusNode _focusNode;
  final ValueNotifier<bool> _isFocused = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      _isFocused.value = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.label != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label!,
              style: widget.labelStyle ?? Font.medium.fs14.gray1()),
          10.h.kH,
          _buildTextFormField(context)
        ],
      );
    } else {
      return _buildTextFormField(context);
    }
  }

  Widget _buildTextFormField(context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: widget.height ?? 50.h),
      child: ValueListenableBuilder(
        valueListenable: _isFocused,
        builder: (context, val, _) {
          return TextFormField(
            readOnly: widget.readOnly,
            onTap: widget.onTap,
            textInputAction: widget.textInputAction,
            focusNode: widget.focusNode,
            initialValue: widget.initialValue,
            controller: widget.controller,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
            autofocus: widget.autoFocus,
            textAlign: widget.textAlign ?? TextAlign.start,
            clipBehavior: widget.clipBehavior ?? Clip.none,
            autovalidateMode: widget.autovalidateMode,
            inputFormatters: widget.inputFormatters,
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.none,
            // readOnly: _isDisabled(),
            validator: widget.validator,
            // cursorColor: cursorColor ?? _getInputColorByStyle(style),
            cursorColor: widget.cursorColor ?? AppColor.gray1,
            obscureText: widget.obscureText ?? false,
            obscuringCharacter: widget.obscuringCharacter ?? '•',
            maxLength: widget.maxLength,
            style: TextStyle(
              fontWeight: widget.hintFontWeight ?? FontWeight.w400,
              fontSize: widget.hintFontSize ?? 14,
              color: widget.textColor ?? widget.hintColor ?? AppColor.gray1,
            ),
            decoration: widget.decoration ??
                InputDecoration(
                  isDense: true,
                  counterText: '',
                  errorText: widget.errorText,
                  suffixIconConstraints:
                      BoxConstraints(maxHeight: widget.suffixMaxheight ?? 55.h),
                  prefixIconConstraints:
                      BoxConstraints(maxHeight: widget.suffixMaxheight ?? 55.h),

                  // floatingLabelStyle: TextStyle(
                  //     color:
                  //         labelColorFloating ?? _getInputBorderColorByStyle(style),
                  //     fontSize: labelFontSize ?? 14,
                  //     fontWeight: labelFontWeight ?? FontWeight.w600),
                  filled: widget.filled,
                  hintText: widget.hint,
                  // floatingLabelBehavior:
                  //     floatingLabelBehavior ?? FloatingLabelBehavior.auto,
                  hintStyle: TextStyle(
                    fontWeight: widget.hintFontWeight ?? FontWeight.w400,
                    fontSize: widget.hintFontSize ?? 14,
                    color: widget.hintColor ?? AppColor.gray3,
                  ),
                  contentPadding: widget.padding ??
                      EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 16.h,
                      ),
                  // fillColor: _isFocused.value ? AppColor.gray5 : Colors.transparent,
                  // focusColor: AppColor.gray5,
                  prefixIcon: widget.prefixWidget,
                  suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: widget.suffixWidget),
                  border: widget.border ? null : InputBorder.none,
                  focusedBorder: widget.border
                      ? OutlineInputBorder(
                          borderRadius: widget.borderRadiusType ??
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                              width: 1,
                              color: widget.borderColor ?? AppColor.blue))
                      : null,
                  enabledBorder: widget.border
                      ? OutlineInputBorder(
                          borderRadius: widget.borderRadiusType ??
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                              width: 1,
                              color: widget.borderColor ?? AppColor.gray5))
                      : null,
                  errorStyle: TextStyle(
                    fontWeight: widget.hintFontWeight ?? FontWeight.w400,
                    fontSize: widget.hintFontSize ?? 14,
                    color: widget.borderColorError,
                  ),
                  errorBorder: widget.border
                      ? OutlineInputBorder(
                          borderRadius: widget.borderRadiusType ??
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                              width: 1,
                              color: widget.borderColorError ??
                                  widget.borderColor ??
                                  AppColor.red))
                      : null,
                  focusedErrorBorder: widget.border
                      ? OutlineInputBorder(
                          borderRadius: widget.borderRadiusType ??
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                              width: 1,
                              color: widget.borderColorError ??
                                  widget.borderColor ??
                                  AppColor.red))
                      : null,
                ),
          );
        },
      ),
    );
  }
}
