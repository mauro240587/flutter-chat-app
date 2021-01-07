import 'package:chat/helpers/mostrar_alerta.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/services/socket_service.dart';

import 'package:chat/widgets/boton_azul.dart';
import 'package:chat/widgets/custom_widget.dart';
import 'package:chat/widgets/labels_widget.dart';
import 'package:chat/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9, //toma toda la pantalla
                              child: Column(            
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, //me alinea por partes todo el form
            
          children: <Widget>[
            Logo(mensaje: 'Messenger',),
            _Form(),
            Labels(ruta: 'register',cuenta: 'Crea una ahora',cuenta1: '¿No tienes Cuenta?',),
          
           Text('Terminos y Condiciones de Uso', style: TextStyle(color: Colors.black54,fontSize: 15, fontWeight: FontWeight.w300)),

          ],     
        ),
              ),
      ),
      ),
   );
  }
}



class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

  final authService = Provider.of<AuthService>(context);
  final socketService = Provider.of<SocketService>(context);

    return Container(
      margin: EdgeInsets.only(top:40),
      padding: EdgeInsets.symmetric(horizontal:50),
      child: Column(
        children:<Widget> [

          CustomInput(
            icon: Icons.mail_outline,
            placeholder:'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),

              CustomInput(
            icon: Icons.lock_outline,
            placeholder:'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),

          BotonAzul(
            text: 'Ingrese', 
            onPressed:authService.autenticando ? null : () async {

              FocusScope.of(context).unfocus();

              final loginOk = await authService.login( emailCtrl.text.trim(), passCtrl.text.trim() );

              if ( loginOk ){
                //conectar al socket
                socketService.connect();
                //Navegar a otra pantalla
                Navigator.pushReplacementNamed(context, 'usuarios');
              } else {
                //mostrar alerta
                mostrarAlerta(context ,'Login incorrecto','Revise sus credenciales');
              }
            },
            )
          
        ],
        ),
      
    );
  }
}

