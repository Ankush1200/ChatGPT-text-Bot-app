import 'package:chatgpt_bot/constant/constant.dart';
import 'package:chatgpt_bot/widget/text_widget.dart';
import 'package:flutter/material.dart';

import '../services/asset-manager.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});

  final String msg;
  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: chatIndex == 0 ? customBackgroundColor : cardcolor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Image.asset(
                chatIndex == 0 ? Assetmanager.userimage : Assetmanager.botimage,
                height: 30,
                width: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: TextWidget(label: msg),
            ),
            chatIndex==0?const SizedBox.shrink():
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.thumb_up_alt_outlined,color: Colors.white,),
                SizedBox(height: 10,),
                Icon(Icons.thumb_down_alt_outlined,color: Colors.white,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
