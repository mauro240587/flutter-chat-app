import 'package:flutter/material.dart';

class Labels extends StatelessWidget {

final String ruta;
final String cuenta;
final String cuenta1;


  const Labels({
    Key key, 
    @required this.ruta,
    @required this.cuenta,
    @required this.cuenta1
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:<Widget> [
          Text(this.cuenta1, style: TextStyle(color: Colors.black54,fontSize: 15, fontWeight: FontWeight.w300)),
          SizedBox(height:10),
          GestureDetector( //para habilitar el texto a que tenga funciones
            child: Text(this.cuenta, style: TextStyle(color: Colors.blue[600],fontSize: 18,fontWeight: FontWeight.bold)),
            onTap: (){
              Navigator.pushReplacementNamed(context, this.ruta); //navegar a otra pagina
            },
            )
      ],
      ),
      
    );
  }
}