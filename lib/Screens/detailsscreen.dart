import 'package:flutter/material.dart';

class Detailsscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final post =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;

    // Extracción de datos con valores predeterminados
    final String imageUrl = post['image'] ?? 'https://via.placeholder.com/200';
    final String username = post['username'] ?? 'Usuario Desconocido';
    final String description =
        post['description'] ?? 'Sin descripción disponible.';
    final String profileImageUrl =
        post['profileImage'] ?? 'https://via.placeholder.com/50';

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle de Publicación"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen principal de la publicación
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            SizedBox(height: 16),
            // Información del usuario con foto de perfil dinámica
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
                SizedBox(width: 8),
                Text(
                  username,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Descripción de la publicación
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            // Botón para volver
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Volver al Feed"),
            ),
          ],
        ),
      ),
    );
  }
}
