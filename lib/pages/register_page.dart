import 'package:chat/widgets/boton_azul.dart';
import 'package:chat/widgets/custom_widget.dart';
import 'package:chat/widgets/labels_widget.dart';
import 'package:chat/widgets/logo_widget.dart';
import 'package:flutter/material.dart';



class RegisterPage extends StatelessWidget {

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
            Logo(mensaje: 'Registro',),
            _Form(),
            Labels(ruta: 'login',cuenta: 'Ingresa con tu cuenta',cuenta1: '¿Tienes Cuenta?',),
          
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
  final nombreCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:40),
      padding: EdgeInsets.symmetric(horizontal:50),
      child: Column(
        children:<Widget> [

          CustomInput(
            icon: Icons.perm_identity,
            placeholder:'Nombre',
            keyboardType: TextInputType.text,
            textController: nombreCtrl,
          ),

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
            onPressed: (){
              print(emailCtrl.text);
              print(passCtrl.text);
               print(nombreCtrl.text);
            },
            )
          
        ],
        ),
      
    );
  }
}

