
import 'package:flutter/material.dart';

class CustomModalBottomSheet extends StatelessWidget {
  final CrossAxisAlignment contentAlignment;
  final List<Widget> content;
  final Color? bgColor;
  final bool expand;
  final EdgeInsetsGeometry? padding;

  const CustomModalBottomSheet({
    super.key,
    this.contentAlignment = CrossAxisAlignment.center,
    required this.content,
    this.padding,
    this.bgColor,
    this.expand = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: double.infinity,
          padding: padding,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12)
              ),
              color: bgColor ?? Colors.white
          ),
          child: Column(
            mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: contentAlignment,
                  children: content,
                ),
              ),
            ],
          )),
    );
  }
}
