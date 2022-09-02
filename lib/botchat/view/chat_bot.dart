import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/botchat/view_model/bot_controller.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:provider/provider.dart';

import 'widgets/messages.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cont = Provider.of<BotController>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
      ),
      body: ColoredBox(
        color: const Color.fromARGB(255, 116, 1, 39),
        child: Column(
          children: [
            Expanded(
                child: MessagesScreens(
              messages: cont.messages,
            )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              color: const Color.fromARGB(255, 253, 253, 253),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      style: const TextStyle(color: blackColor),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cont.sendMessage(controller.text);

                      controller.clear();
                    },
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
