import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateUserScreen extends StatefulWidget {
  @override
  _CreateUserScreenState createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _createUser() {
    String name = _nameController.text;
    String email = _emailController.text;

    if (name.isNotEmpty && email.isNotEmpty) {
      _firestore.collection('users').add({
        'name': name,
        'email': email,
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Usuario creado exitosamente')),
        );
        _nameController.clear();
        _emailController.clear();
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $error')),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor completa todos los campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear Usuario"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _createUser,
              child: Text('Crear Usuario'),
            ),
          ],
        ),
      ),
    );
  }
}
