import 'package:flutter/material.dart';
import '../../controllers/user_controller.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void _register() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      UserController().registerUser(_email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Obteniendo las dimensiones de la pantalla
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.08), // Proporcional al ancho de la pantalla
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: screenHeight * 0.02), // Espacio proporcional a la altura de la pantalla
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: screenHeight * 0.02), // Tamaño de texto proporcional
                ),
                onSaved: (value) => _email = value!,
                validator: (value) => value!.isEmpty ? 'Este campo es obligatorio' : null,
              ),
              SizedBox(height: screenHeight * 0.02), // Espacio proporcional
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontSize: screenHeight * 0.02), // Tamaño de texto proporcional
                ),
                obscureText: true,
                onSaved: (value) => _password = value!,
                validator: (value) => value!.isEmpty ? 'Este campo es obligatorio' : null,
              ),
              SizedBox(height: screenHeight * 0.05), // Espacio proporcional
              ElevatedButton(
                onPressed: _register, // Tamaño de texto proporcional
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015, horizontal: screenWidth * 0.2), // Padding proporcional
                ),
                child: Text('Registrar', style: TextStyle(fontSize: screenHeight * 0.02)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
