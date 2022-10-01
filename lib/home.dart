import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHome extends StatefulWidget {

  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}
class _MyHomeState extends State<MyHome> {
 
  myAchieve(num,type)
  {
    return Row(
          children: [
            Text(num,style: TextStyle(
              fontSize: 30,fontWeight: FontWeight.bold,
            )),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(type),
            ),
          ],
        );
  }
  myspec(icon,tech){
    return Container(
      width: 105,
      height: 115,
      child:GestureDetector(
        onTap: ()=> _launchUrl('https://github.com/Shahrukh-cyber?tab=repositories'),
        child: Card(
          margin: EdgeInsets.all(0),
          color: Color(0xff252525),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon,color: Colors.white),
                SizedBox(height: 10),
                Text(tech,style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),)],
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: PopupMenuButton(
        color: Colors.black,
        icon: Icon(Icons.menu),
        itemBuilder: (context)=> [
          PopupMenuItem(child: TextButton(
            child: Text('Projects',style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pushNamed(context, 'projects');
            },
          ),
          value: 1,
          ),
         PopupMenuItem(child: TextButton(
           child: Text('About Me ',style: TextStyle(color: Colors.white),),
           onPressed: () {
             Navigator.pushNamed(context, 'about');
           },
         ),
         value: 2,
         )
        ] ,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          // Enable snapping. This is true by default.
          snap: true,
          // Set custom snapping points.
          snappings: [0.38, 0.7, 1.0],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
        body: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 35,left: 20),
                child: ShaderMask(

                    shaderCallback: (rect) {
                      return LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black,Colors.transparent])
                          .createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.asset('assets/image.png',
                      height: 450,
                      fit: BoxFit.contain,)),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.49 ),
                child: Column(
                  children: [
                    Text('Muhammad Shahrukh',style: TextStyle(
                      fontSize: 35 , fontWeight: FontWeight.bold,color: Colors.white,
                      fontFamily: "soho",
                    ),),
                    SizedBox(height: 2,),
                    Text('Application Developer ',style: TextStyle(
                      fontSize: 25,color: Colors.white,
                      fontFamily: "soho",
                    ),),
                  ],
                ),
              ),
            ],
          ),
        ),
        builder: (context, state) {
          // This is the content of the sheet that will get
          // scrolled, if the content is bigger than the available
          // height of the sheet.
          return Container(
            height: 500,
            margin: EdgeInsets.only(right: 20,left: 20,top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myAchieve('78', ' Projects'),
                    myAchieve('65', ' Clients'),
                    myAchieve('92', ' Message'),
                  ],
                ),
                SizedBox(height: 30),
                Text('Specialized In',style: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        myspec(FontAwesomeIcons.android, 'Android'),
                        myspec(FontAwesomeIcons.apple, 'IOS'),
                        myspec(FontAwesomeIcons.windows, 'Windows'),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        myspec(FontAwesomeIcons.java, 'Java'),
                        myspec(FontAwesomeIcons.angular, 'Angular'),
                        myspec(FontAwesomeIcons.react, 'React'),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        myspec(FontAwesomeIcons.python, 'Python'),
                        myspec(FontAwesomeIcons.robot, 'Robotics'),
                        myspec(FontAwesomeIcons.html5, 'Html/CSS'),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        },
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
