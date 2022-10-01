
// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return IconButton(
      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
        icon: FaIcon(FontAwesomeIcons.gamepad),
        onPressed: () { print("Pressed"); }
    );
  }
}

class MyAbout extends StatefulWidget {
  const MyAbout({Key? key}) : super(key: key);

  @override
  State<MyAbout> createState() => _MyAboutState();
}

class _MyAboutState extends State<MyAbout> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60,left: 20),
              child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black87,Colors.transparent])
                        .createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset('assets/image.png',
                    height: 450,
                    fit: BoxFit.contain,)),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.55),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text('Hello I am ',style: TextStyle(
                fontSize: 35 ,color: Colors.white,
              )),
                  SizedBox(height: 10,),
                  Text('Muhammad Shahrukh',style: TextStyle(
                    fontSize: 35 , fontWeight: FontWeight.bold,color: Colors.white,
                  ),),
                  SizedBox(height: 15,),
                  Text('Application Developer ',style: TextStyle(
                    fontSize: 25,color: Colors.white,
                  ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: 120,
                    child: TextButton(onPressed: () {},
                        child: Text('Hire Me'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),),
                  ),
                  SizedBox(height: 45,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () async {
                        String email = 'muhammadshahrukhk87@gmail.com';
                        String subject= 'Hi';
                        String body= 'Hello Muhammad, hope you are doing well ';

                        String? encodeQueryParameters(Map<String, String> params){
                          return params.entries
                              .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
                        }

                        final  Uri emailUri = Uri(
                          scheme: 'mailto',
                          path: email,
                          query: encodeQueryParameters(
                            <String, String>{'subject': subject, 'body': body}),
                        );
                        if(await canLaunch(emailUri.toString())){
                          launch(emailUri.toString());
                        } else{
                          print("The action is not supported. (No email app) ");
                        }
                      },
                          icon: Icon(
                            Icons.email,color: Colors.white,
                          )),
                     IconButton(onPressed: ()=> _launchUrl('https://www.linkedin.com/in/muhammad-shahrukh-khan-628271194/'),
                            icon: Icon(
                              FontAwesomeIcons.linkedin,color: Colors.white,
                            )),
                      IconButton(
                          onPressed: () => _launchUrl('https://github.com/Shahrukh-cyber'),
                          icon: Icon(
                            FontAwesomeIcons.github,color: Colors.white,
                          )),
                      IconButton(onPressed: ()=> _launchUrl('https://instagram.com/k.muhammadshahrukh?igshid=YmMyMTA2M2Y='),
                          icon: Icon(
                            FontAwesomeIcons.instagram,color: Colors.white,
                          )),
                      IconButton(onPressed: ()=> _launchUrl('https://www.facebook.com/mohammad.s.khan.35110'),
                          icon: Icon(
                            FontAwesomeIcons.facebook,color: Colors.white,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _launchUrl(String urlToLaunch) async {
    if (!await launchUrl(Uri.parse(urlToLaunch)
    )) {
      throw 'Could not launch $urlToLaunch()';
    }
  }
    }
