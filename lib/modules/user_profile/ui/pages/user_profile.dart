import 'package:flutter/material.dart';
import 'package:flutter_capacitaciones/modules/user_profile/ui/widgets/back_arrow.dart';
import 'package:flutter_capacitaciones/modules/user_profile/ui/widgets/profile_buttons.dart';
import 'package:flutter_capacitaciones/modules/user_profile/ui/widgets/profile_pic.dart';
import 'package:flutter_capacitaciones/modules/user_profile/ui/widgets/profile_stats.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final List<String> imageUrls = [
    'https://images.pexels.com/photos/3225517/pexels-photo-3225517.jpeg',
    'https://images.pexels.com/photos/3225517/pexels-photo-3225517.jpeg',
    'https://images.pexels.com/photos/3225517/pexels-photo-3225517.jpeg',
    'https://images.pexels.com/photos/3225517/pexels-photo-3225517.jpeg',
    'https://images.pexels.com/photos/3225517/pexels-photo-3225517.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(193, 5, 19, 58),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //Ambos elementos
            children: [
              const SizedBox(
                // Seccion del usuario
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        // Flecha de regresar
                        children: [
                          BackArrow(),
                        ],
                      ),
                      SizedBox(height: 16),
                      //Datos de usuario
                      ProfilePic(
                        radius: 70,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Stephany Lebrun',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Photographer',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        // Stats de la cuenta
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              ProfileStats(
                                property: 'Posts',
                                number: '150',
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              ProfileStats(
                                property: 'Followers',
                                number: '834',
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              ProfileStats(
                                property: 'Following',
                                number: '341',
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        // Botones
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfileButton(
                            textButton: 'Follow',
                            textColor: Color.fromARGB(255, 206, 197, 26),
                            backgroundColor: Colors.white,
                          ),
                          ProfileButton(
                            textButton: 'Mesaage',
                            textColor: Colors.white,
                            backgroundColor: Color.fromARGB(255, 206, 197, 26),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              LayoutBuilder(
                // Seccion de imagenes
                builder: (context, constraints) {
                  int crossAxisCount = 3;
                  double width = constraints.maxWidth;

                  if (width < 600) {
                    crossAxisCount = 3;
                  } else if (width < 900) {
                    crossAxisCount = 4;
                  } else {
                    crossAxisCount = 5;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                    ),
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        imageUrls[index],
                        fit: BoxFit.cover,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
