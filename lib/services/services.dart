import 'package:chatgpt_bot/widget/drop_down.dart';
import 'package:flutter/material.dart';
import '../constant/constant.dart';
import '../widget/text_widget.dart';

class Services {
  static Future<void> showModalSheet({required BuildContext context}) async {
    await showModalBottomSheet(
      backgroundColor: customBackgroundColor,
      context: context,
      builder: (context) {
        return const Padding(
          padding: EdgeInsets. all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: TextWidget(
                  label: "Models",
                  fontSize: 18,
                ),
              ),
              Flexible(
                flex: 2,
                child:ModelDropdownButton()),
            ],
          ),
        );
      },
    );
  }
}
