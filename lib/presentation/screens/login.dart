
import 'package:agricultura_venta/dominio/models/usuarios.dart';
import 'package:flutter/material.dart';

import '../../datos/usuario_list.dart';
import 'inicio.dart';
import 'registrar_usuario.dart';

class Login extends StatelessWidget {
  List<Usuario> filterItems = usuarios;

  final TextEditingController correoValidar = TextEditingController();
  final TextEditingController passwordValidar = TextEditingController();

  void _signIn(BuildContext context) {
  // Verificar si los campos de correo y contraseña están vacíos
  if (correoValidar.text.isEmpty || passwordValidar.text.isEmpty) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error de inicio de sesión'),
          content: const Text('Por favor, ingresa correo y contraseña.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
    return; // Salir de la función si los campos están vacíos
  }

  // Buscar el usuario en la lista de usuarios
  int index = filterItems.indexWhere((usuario) => usuario.correo == correoValidar.text);

  if (index != -1 && filterItems[index].contrasena == passwordValidar.text) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Inicio()));
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error de inicio de sesión'),
          content: const Text('Credenciales incorrectas. Por favor, intenta de nuevo.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 160, // Ancho deseado
              height: 160, // Alto deseado
              child: Image.asset('assets/img/icon.jpg'),
            ),
            const Text('EcoCosecha', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, fontFamily:'Satisfy'),),
            TextField(controller: correoValidar, decoration: const InputDecoration(labelText: 'Correo')),
            TextField(controller: passwordValidar, decoration: const InputDecoration(labelText: 'Contraseña'),
            obscureText: true,),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () => _signIn(context), child: const Text('Iniciar Sesión',
                style: TextStyle(fontSize: 20,))),
          
             const SizedBox(height: 3),
            TextButton(
              onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegistrarUsuario(),),);
                      },
              child: const Text(
                'Registrar',
                style: TextStyle(fontSize: 20,
                  color: Color.fromARGB(240, 136, 99, 86), // Cambia el color del texto a azul u otro color que desees.
                  decoration: TextDecoration.underline, // Agrega una línea subrayada al texto para que parezca un enlace.
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
