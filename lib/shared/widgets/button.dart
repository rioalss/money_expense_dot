import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:money_expense_dot/shared/utils/extension/double_extension.dart';
import 'package:money_expense_dot/themes/app_color.dart';
import 'package:money_expense_dot/themes/typography.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom(
      {super.key,
      required this.onPressed,
      required this.text,
      this.disable = false,
      this.iconImg = false,
      this.iconSuffix = false,
      this.iconPrefix,
      this.width,
      this.fontStyle,
      this.radius,
      this.bgColor,
      this.borderColor,
      this.widthBorder,
      this.radiusType,
      this.height});
  final Function() onPressed;
  final String text;
  final String? iconPrefix;
  final bool disable;
  final bool iconImg;
  final bool iconSuffix;
  final double? width;
  final double? widthBorder;
  final double? radius;
  final BorderRadiusGeometry? radiusType;
  final Color? bgColor;
  final Color? borderColor;
  final TextStyle? fontStyle;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return _elevatedButton();
  }

  Widget _elevatedButton() {
    return ElevatedButton(
      onPressed: disable ? null : onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: disable ? AppColor.gray5 : null,
        splashFactory:
            disable ? NoSplash.splashFactory : InkSplash.splashFactory,
        backgroundColor: disable ? AppColor.gray5 : bgColor ?? AppColor.blue,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: widthBorder ?? 1),
          borderRadius: radiusType ?? BorderRadius.circular(radius ?? 6.r),
        ),
        fixedSize: Size(width ?? Get.width, height ?? 50.h),
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return bgColor != null
                  ? AppColor.blue.withOpacity(.5)
                  : Colors.white70; // Customize your splash color here
            }

            return null; // Use default splash color if not pressed
          },
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Builder(
                builder: (context) {
                  if (iconPrefix == null) {
                    return Text(
                      text,
                      style: fontStyle ??
                          Font.bold.fs18
                              .gray1()
                              .copyWith(color: AppColor.white),
                    );
                  }

                  if (iconSuffix) {
                    return Row(
                      children: [
                        Text(
                          text,
                          style: fontStyle ??
                              Font.bold.fs18
                                  .gray1()
                                  .copyWith(color: AppColor.white),
                        ),
                        5.w.kW,
                        if (iconPrefix != null)
                          iconImg
                              ? Image.asset(iconPrefix!)
                              : SvgPicture.asset(iconPrefix!),
                      ],
                    );
                  }

                  return Row(
                    children: [
                      Builder(
                        builder: (context) {
                          if (iconPrefix != null) {
                            if (iconImg) return Image.asset(iconPrefix!);

                            return SvgPicture.asset(iconPrefix!);
                          }

                          return const SizedBox();
                        },
                      ),
                      5.w.kW,
                      Text(
                        text,
                        style: fontStyle ??
                            Font.bold.fs18
                                .gray1()
                                .copyWith(color: AppColor.white),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonLoading extends StatelessWidget {
  const ButtonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        backgroundColor: AppColor.blue,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(6.r),
        ),
        fixedSize: Size(Get.width, 50.h),
      ),
      child: const SpinKitThreeBounce(
        color: Colors.white,
        size: 24,
      ),
    );
  }
}
