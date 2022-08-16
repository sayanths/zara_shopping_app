import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/core/color/colors.dart';

class MessagesScreens extends StatefulWidget {
  final List messages;
  const MessagesScreens({Key? key, required this.messages}) : super(key: key);

  @override
  State<MessagesScreens> createState() => _MessagesScreensState();
}

class _MessagesScreensState extends State<MessagesScreens> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      
      itemCount: widget.messages.length,
      separatorBuilder: (_, i) {
        return Padding(padding: EdgeInsets.all(10));
      },
      itemBuilder: (context, index) {
        
        return Row(
          mainAxisAlignment:widget.messages[index]['isUserMessage']?MainAxisAlignment.end :MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(vertical: 14,horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(widget.messages[index]['isUserMessage']? 0 :20),
                   topLeft: Radius.circular(widget.messages[index]['isUserMessage']? 0 :20),
                ),
                color: widget.messages[index]['isUserMessage']
                ?Colors.green
                :Colors.grey,
                
              ),
              constraints: BoxConstraints(maxWidth:  MediaQuery.of(context).size.width *2/3),
              child: Text(widget.messages[index]['message'].text.text[0]),
            ),
          ],
        );
      },
    );
  }
}
