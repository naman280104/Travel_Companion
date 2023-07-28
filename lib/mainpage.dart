import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_companion/common_widgets/travel_card.dart';
import 'package:travel_companion/services/auth_services.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Travel Companion",style: TextStyle(fontStyle: FontStyle.italic),),
        actions: [
          IconButton(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            onPressed: (){}, 
            icon: Icon(CupertinoIcons.profile_circled,size: 32,)),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Travel_card(src: "Fukeshima Bhagabhaki Bhagura heloooo",dst: "Dhaum Dhum Dham Dhum Dhum Dhum",dur: Duration(hours: 1,minutes: 30),datetime: DateTime.now(),veh: "Helicopter",),
                    Travel_card(src: "Fukeshima Bhagabhaki Bhagura heloooo",dst: "Dhaum Dhum Dham Dhum Dhum Dhum",dur: Duration(hours: 1,minutes: 30),datetime: DateTime.now(),veh: "Helicopter",),
                    Travel_card(src: "Fukeshima Bhagabhaki Bhagura heloooo",dst: "Dhaum Dhum Dham Dhum Dhum Dhum",dur: Duration(hours: 1,minutes: 30),datetime: DateTime.now(),veh: "Helicopter",),
                  ],
                ),
                // child: Center(child: ElevatedButton(onPressed: (){AuthService().logout();}, child: Text("logout")),),
              ),
            ),
            Container(
              width: double.infinity,
              height: screenheight*0.05,
              color: Colors.teal,
              )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){},
        child: Container(
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.add,size: 30,)
            ),
        ),
      ),
    );
  }
}