import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:money_expense_dot/shared/gen/assets.gen.dart';

enum TypeToast { error, info, success }

class CustomToastWidget extends StatelessWidget {
  const CustomToastWidget(this.msg, {Key? key, this.type = TypeToast.info})
      : super(key: key);

  final String msg;
  final TypeToast type;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color:
                  type == TypeToast.error ? Colors.red.shade100 : Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: Colors.black.withOpacity(.3),
                  offset: const Offset(0, 3),
                )
              ]),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset(
                  Assets.logo.logoPng.path,
                  height: 20,
                  width: 20,
                  fit: BoxFit.contain,
                ),
              ),
              Flexible(
                child: Text(
                  msg,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomToast {
  static Future<void> showToast({
    required String message,
    TypeToast type = TypeToast.info,
  }) async {
    await SmartDialog.dismiss();
    SmartDialog.showToast(
      '',
      displayTime: const Duration(seconds: 3),
      builder: (_) => CustomToastWidget(
        message,
        type: type,
      ),
    );
  }

  //   Fluttertoast.showToast(
  //     msg: message,
  //     gravity: gravity,
  //     backgroundColor: _getColor(type),
  //     toastLength: toastLength,
  //     fontSize: 16,
  //     textColor: Colors.white,
  //   );
  // }

  // static Widget _buildToastWidget(String message, TypeToast type) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(25.0),
  //       color: _getColor(type),
  //       boxShadow: [
  //         BoxShadow(
  //             color: Colors.black.withOpacity(0.2),
  //             blurRadius: 2,
  //             offset: const Offset(0, 4))
  //       ],
  //     ),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         SizedBox(
  //             height: 12.h,
  //             width: 12.w,
  //             child: FittedBox(child: _getIcon(type))),
  //         10.w.kW,
  //         Text(
  //           message,
  //           style: Font.semiBold.fs14.white(),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // static Icon _getIcon(TypeToast type) {
  //   switch (type) {
  //     case TypeToast.info:
  //       return const Icon(Icons.info, color: Colors.white);
  //     case TypeToast.error:
  //       return const Icon(Icons.close, color: Colors.white);
  //     case TypeToast.success:
  //       return const Icon(Icons.check_circle, color: Colors.white);
  //     default:
  //       return const Icon(Icons.info, color: Colors.white); // Fallback icon
  //   }
  // }
}
