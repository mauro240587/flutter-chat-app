import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatMessage extends StatelessWidget {

final String texto; //envia el texto de los mensajes
final String uid;  //para identificar quien manda el mensaje
final AnimationController animationController;

  const ChatMessage({
    Key key, 
   @required this.texto, 
   @required this.uid, 
   @required this.animationController
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

final authService = Provider.of<AuthService>(context, listen: false);

    return FadeTransition(
      opacity: this.animationController,
          child: SizeTransition(
            sizeFactor: CurvedAnimation(parent: animationController,curve:Curves.easeOut),
        child: Container(
        child: this.uid == authService.usuario.uid
        ? _myMessage()
        : _notMyMessage(),
      ),
          ),
    );
  }
        
Widget _myMessage() {
return Align(
  alignment: Alignment.centerRight,
  child: Container(
    padding:EdgeInsets.all(8.0),
    margin: EdgeInsets.only(
      right: 5,
      bottom:5,
      left: 50,
    ),
    child: Text(this.texto, style: TextStyle(color: Colors.white ), ),
    decoration: BoxDecoration(
      color: Color(0xff4D9EF6),
      borderRadius: BorderRadius.circular(20),
    ),
  ),
);
}

Widget _notMyMessage() {
return Align(
  alignment: Alignment.centerLeft,
  child: Container(
    padding:EdgeInsets.all(8.0),
    margin: EdgeInsets.only(
      right: 50,
      bottom:5,
      left: 5,
    ),
    child: Text(this.texto, style: TextStyle(color: Colors.black ), ),
    decoration: BoxDecoration(
      color: Color(0xffE4E5E8),
      borderRadius: BorderRadius.circular(20),
    ),
  ),
);
}

}