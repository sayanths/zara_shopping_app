import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BotController extends ChangeNotifier {
  String? message;
  BotController() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
  }
  late DialogFlowtter dialogFlowtter;
  final TextEditingController controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  sendMessage(String text) async {
    if (text.isEmpty) {
      if (kDebugMode) {
        print("message is empty");
      }
    } else {
      addMessage(Message(text: DialogText(text: [text])), true);
      notifyListeners();
      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) {
        return;
      } else {
        addMessage(response.message!);
        notifyListeners();
      }
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }

  @override
  notifyListeners();
}
