
import 'package:flutter/material.dart';

import '../../datos/usuario_list.dart';
import '../../dominio/models/usuarios.dart';
import 'login.dart';

class RegistrarUsuario extends StatefulWidget {
  const RegistrarUsuario({Key? key}) : super(key: key);

  @override
  State<RegistrarUsuario> createState() => _RegistrarUsuarioState();
}

class _RegistrarUsuarioState extends State<RegistrarUsuario> {

   final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final TextEditingController _confContrasenaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child:ListView(
            children: [
              const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon:const Icon(Icons.arrow_back)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 160, // Ancho deseado
                    height: 160, // Alto deseado
                    child: Image.asset('assets/img/icon.jpg'),
                  ),
              ],
            ),
              TextFormField(
                decoration:const InputDecoration(
                  labelText: 'Nombre'
                ),
              controller: _nombreController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa un nombre';
                }
                return null;
                },
              ),
               TextFormField(
                decoration:const InputDecoration(
                  labelText: 'Apellido'
                ),
              controller: _apellidoController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa un apellido';
                }
                return null;
                }, 
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Correo'
                ),
              controller: _correoController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa un correo';
                }
                return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Contraseña'
                ),
              controller: _contrasenaController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa una contraseña';
                }
                return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Confirmar contraseña'
                ),
              controller: _confContrasenaController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor Confirmar contraseña';
                }
                return null;
                },
              ),
           
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                       if(_contrasenaController.text != _confContrasenaController.text){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:Text('Las ontraseñas no coinciden.'),
                              backgroundColor: Colors.red,
                               )
                          );
                       }else{
                        var newUsuario = Usuario(
                        nombre: _nombreController.text, 
                        apellido: _apellidoController.text, 
                        correo: _correoController.text, 
                        contrasena: _contrasenaController.text, 
                        );
                        usuarios.add(newUsuario);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Login(),));
                        
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Registro Exitoso'),
                        backgroundColor: Colors.green,),
                        
                      );
                       }
                    }
                  },
                  child: const Text('Registrar', style: TextStyle(fontSize: 15),),
                ),
              ),
      
            ],
        
          ),
           ),
      ),
    );
  }
}