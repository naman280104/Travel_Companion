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
        width: double.infinity,
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
            onPressed: (){
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context, 
                builder: (context){
                return Container(
                  height: 600,
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Let's find your companions",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                        SizedBox(height: 7,),
                        Text("Create",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.grey),),
                        SizedBox(height: 16,),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Text("From",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                            Expanded(child: SizedBox(width: 1,),flex: 1,),
                            Container(
                              width: screenwidth*0.25,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide()),
                                color: Color(0xFFECECEC)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Expanded(child: SizedBox(width: 1,),flex: 2,),
                            Text("To",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                            Expanded(child: SizedBox(width: 1,),flex: 1,),
                            Container(
                              width: screenwidth*0.25,
                              height: 34,
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide()),
                                color: Color(0xFFECECEC)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Expanded(child: SizedBox(width: 1,),flex: 1,),
                          ],
                        ),
                        SizedBox(height:20),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Text("Mode of Transport",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                            Expanded(child: SizedBox(width: 1,),flex: 1,),
                            Container(
                              width: screenwidth*0.3,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide()),
                                color: Color(0xFFECECEC)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                                child: TextFormField(
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Expanded(child: SizedBox(width: 1,),flex: 3,),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Text("Date & Time",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                            Expanded(child: SizedBox(width: 1,),flex: 1,),
                            Container(
                              width: screenwidth*0.35,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide()),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(""),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.calendar_today))
                                ],
                              )
                            ),
                            Expanded(child: SizedBox(width: 1,),flex: 3,),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            SizedBox(width: 10,),
                            Text("Duration",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                            Expanded(child: SizedBox(width: 1,),flex: 1,),
                            Container(
                              width: screenwidth*0.35,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide()),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(""),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.timer_outlined))
                                ],
                              )
                            ),
                            Expanded(child: SizedBox(width: 1,),flex: 3,),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
            }, 
            icon: Icon(Icons.add,size: 30,)
            ),
        ),
      ),
    );
  }
}