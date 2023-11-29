
import 'package:chatgpt_bot/constant/constant.dart';
import 'package:chatgpt_bot/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../providers/model_provider.dart';
import '../services/api_services.dart';
import '../widget/chatwidget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _istyping = true;
  late TextEditingController messagecontroller;
  
  // get modelsProvider => null;

  @override
  void initState() {
    messagecontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    messagecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/openai_logo.png',
            height: 10,width: 10,
            ),
          ),
          title: const Text(
            "ChatGPT Clone",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: cardcolor,
          elevation: 1,
          actions: [
            IconButton(
              onPressed: () async {
                await Services.showModalSheet(context: context);
              },
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return ChatWidget(
                        msg: chatMessages[index]["msg"].toString(),
                        chatIndex: int.parse(
                            chatMessages[index]["chatIndex"].toString()),
                      );
                    }),
              ),
              if (_istyping) ...[
                const SpinKitThreeBounce(
                  color: Colors.white,
                  size: 18,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Material(
                      color: cardcolor,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(left: 10),
                                child: TextField(
                                  controller: messagecontroller,
                                  // onSubmitted: (value) {
                                  //   // send function
                                  // },
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: const InputDecoration.collapsed(
                                    hintText: 'Ask me anything...',
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  cursorColor: Colors.white,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                               await ApiService.sendmessages(
                                message: messagecontroller.text,
                                modelid: ModelsProvider.getCurrentModel,
                               );
                              },  
                              icon: const Icon(Icons.send,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      );
  }
  }
