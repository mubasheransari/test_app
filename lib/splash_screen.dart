import 'package:flutter/material.dart';
import 'package:test_app/Features/catgories/views/home_view.dart';
import 'package:test_app/widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.9),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          const SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20),

                CustomTextWidget(
                  text: 'The Store',
                  textSize: 50,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontFamily: 'playfair',
                ),

                Spacer(),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: CustomTextWidget(
                    text: 'Välkommen!',
                    textSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 40),
                //   child: CustomTextWidget(
                //     text:
                //         'Hos ass kan du baka tid has nastan alla Sveriges salonger och motagningar. Baka frisor, massage, skonhetsbehandingar, friskvard och mycket mer.',
                //     textSize: 14,
                //     fontWeight: FontWeight.w400,
                //     color: Colors.white,
                //   ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Hos ass kan du baka tid has nastan alla Sveriges salonger och motagningar. Baka frisor, massage, skonhetsbehandingar, friskvard och mycket mer.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins'),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 130),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
