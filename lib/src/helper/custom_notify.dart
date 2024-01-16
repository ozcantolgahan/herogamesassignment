import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hero_games_assignment/src/widgets/custom_text_widget.dart';

enum NotifyType { success, warning, error }

class CustomNotify {
  final String? title;
  final NotifyType? type;
  final Duration? duration;

  String? message;

  CustomNotify(
      {this.title = "",
      this.type = NotifyType.error,
      this.message,
      this.duration});

  show(BuildContext context) => _build().show(context);

  Flushbar _build() {
    return Flushbar(
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      titleText: title == ""
          ? Padding(
              padding: EdgeInsets.only(top: 6.w),
              child: CText(
                message ?? "",
                style: TextStyle(color: Colors.white),
              ),
            )
          : null,
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.circular(12.w),
      messageText: title == "" ? Container() : null,
      margin: EdgeInsets.all(12.w),
      backgroundColor: _getColor(type ?? NotifyType.error),
      duration: duration ?? const Duration(seconds: 2),
      isDismissible: true,
      title: title != null ? title! : "",
      message: message ?? " ",
    );
  }

  Color _getColor(NotifyType type) {
    switch (type) {
      case NotifyType.success:
        return Colors.green;
      case NotifyType.error:
        return Colors.red;
      default:
        return Colors.red;
    }
  }
}
