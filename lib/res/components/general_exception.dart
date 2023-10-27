import 'package:flutter/material.dart';
import 'package:flutter_androssy/services.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:get/get.dart';

class GeneralExceptionView extends StatelessWidget {
  final OnViewClickListener? onClick;

  const GeneralExceptionView({
    super.key,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return NullableView(
      icon: Icons.cloud_off,
      body: "general_exception".tr,
      buttonText: "try_again".tr,
      onButtonClick: onClick,
    );
  }
}
