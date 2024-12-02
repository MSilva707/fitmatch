import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> posts = [
    {
      "image":
          "https://static8.depositphotos.com/1037473/852/i/450/depositphotos_8520854-stock-photo-young-woman-running-outdoors-in.jpg",
      "username": "CyberTrailz",
      "description": "¡Hoy logré 5km de carrera! #motivada",
      "profileImage":
          "https://i.pinimg.com/564x/43/e5/56/43e556e1e9a8523adf97bea0af9dfd9a.jpg",
    },
    {
      "image":
          "https://media.revistagq.com/photos/626129a9ccd6a6f5a20e10fb/master/pass/GettyImages-615883422.jpg",
      "username": "PixelNomad",
      "description": "Nueva rutina de fuerza. ¡A por ello! 💪",
      "profileImage":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHNFMenZNzfpB8eGvhuFCRxxjFToeFT2iYow&s",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoTF8Hs9_IRiPiHBDoz0_ph9pPm2WhHEBdGQ&s",
      "username": "FitVibesDaily",
      "description": "La mejor guía de nutrición está aquí 🥗.",
      "profileImage":
          "https://w0.peakpx.com/wallpaper/204/777/HD-wallpaper-skye-valorant-thumbnail.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fitmatch",
          style: TextStyle(fontFamily: "Lobster", fontSize: 24),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/create_user');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Usuario y avatar
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      posts[index]["profileImage"]!,
                    ),
                  ),
                  title: Text(
                    posts[index]["username"]!,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                // Imagen principal
                Image.network(
                  posts[index]["image"]!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
                // Descripción y botones
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        posts[index]["description"]!,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.comment_outlined),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/details',
                                arguments: posts[index],
                              );
                            },
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.share),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
