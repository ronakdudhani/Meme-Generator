import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meme_generator/screens/edit_image_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(138, 35, 135, 1.0),
                  Color.fromRGBO(233, 64, 87, 1.0),
                  Color.fromRGBO(242, 113, 33, 1.0),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(35, 75, 20, 100),
                  child: Text(
                    'Meme Generator',
                    style: GoogleFonts.getFont(
                      'Lobster',
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.upload_file,
                    ),
                    onPressed: () async {
                      XFile? file = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                      );
                      if (file != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                EditImageScreen(selectedImage: file.path),
                          ),
                        );
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 100, 20, 50),
                  child: Text(
                    '''Welcome to our meme generator! Get ready to unleash your inner meme master and create some hilarious internet gold. With our user-friendly tool, you can easily create your own custom memes and share them with the world.
      \n Upload your image and add your own unique caption or text overlay. Whether you want to make your friends laugh or make a statement, our meme generator has got you covered. So, what are you waiting for? Let\'s get memeing!''',
                    style: GoogleFonts.getFont(
                      'Edu NSW ACT Foundation',
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin:  EdgeInsets.only(top: 25),
                  child: Text(
                    'By Ronak Agrawal',
                    style: GoogleFonts.getFont(
                      'Lobster',
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
