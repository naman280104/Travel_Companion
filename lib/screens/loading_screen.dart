import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:travel_companion/services/auth_services.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(child: SizedBox(height: 1,),flex:1),
            Container(
              height: screenheight*0.3,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/travel_companion.png'),)
              ),
            ),
            Expanded(child: SizedBox(height: 1,),flex:1),
            Text("Welcome",style: TextStyle(fontSize: 22),),
            Text("Lets find your companion :)",style: TextStyle(fontSize: 22),),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  width: screenwidth*0.25,
                  color: Colors.black,
                ),
                SizedBox(width: 10,),
                Text("Login with Google"),
                SizedBox(width: 10,),
                Container(
                  height: 1,
                  width: screenwidth*0.25,
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(height:10),
            Container(
              height: 50,
              width: screenwidth*0.8,
              child: SignInButton(
                  Buttons.google,
                  onPressed: (){
                    AuthService().signInWithGoogle();
                  },
                ),
            ),
            Expanded(child: SizedBox(height: 1,),flex:1),
          ],
        ),

      ),
    );
  }
}