import 'package:duration_picker_dialog_box/duration_picker_dialog_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_companion/common_widgets/travel_card.dart';
import 'package:travel_companion/services/auth_services.dart';
import 'package:travel_companion/services/data_service.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser);
    var dataservice = Get.put(DataService());
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Travel Companion",style: TextStyle(fontStyle: FontStyle.italic),),
        actions: [
          IconButton(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            onPressed: (){
              AuthService().logout();
            }, 
            icon: Icon(CupertinoIcons.profile_circled,size: 32,)),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Obx(
                  ()=>Column(
                    children: dataservice.cards.asMap().entries.map((e){
                      return Container(
                        padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                        child: FlipCard(
                          fill: Fill.fillBack,
                          front: Travel_card(src: e.value["Source"], dst: e.value["Destination"], datetime: DateTime.fromMillisecondsSinceEpoch(e.value["date_time"]*1000), dur: e.value["Duration"], veh: e.value["Mode_of_transport"]),
                          back: Travel_card_back(displayname: e.value['posted_by'][0],email: e.value['posted_by'][1],companions: e.value["companions"],msg: e.value["Message"],index: e.key,),
                        ),
                      );
                  }).toList(),
                  ),
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
              List<String> friends = [];
              DateTime? startdatetime;
              Duration? dur;
              String from="";
              String to="";
              String modeoftravel="";
              String message="";
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context, 
                builder: (context){
                return StatefulBuilder(builder: ((context, setState){
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
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                              children: [
                                SizedBox(width: 10,),
                                Text("From",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                                Expanded(child: SizedBox(width: 1,),flex: 1,),
                                Container(
                                  width: screenwidth*0.25,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide()),
                                    color: Color(0xFFECECEC)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                                    child: TextFormField(
                                      style: TextStyle(fontSize: 20),
                                      onChanged: (value) {
                                        from=value;
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(child: SizedBox(width: 1,),flex: 2,),
                                Text("To",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                                Expanded(child: SizedBox(width: 1,),flex: 1,),
                                Container(
                                  width: screenwidth*0.25,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide()),
                                    color: Color(0xFFECECEC)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        to=value;
                                      },
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
                                  height: 45,
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide()),
                                    color: Color(0xFFECECEC)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                                    child: TextFormField(
                                      onChanged:(value) {
                                        modeoftravel=value;
                                      },
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
                                Expanded(child: SizedBox(width: 1,),flex: 5,),
                                Container(
                                  width: screenwidth*0.53,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide()),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      startdatetime!=null?Text(DateFormat('jm').format(startdatetime!)+" "+DateFormat('yMMMd').format(startdatetime!),style: TextStyle(fontSize: 16,color: Colors.black),):Text(""),
                                      IconButton(onPressed: ()async {
                                        DateTime? datepicked = await showDatePicker(
                                          context: context, 
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2050),
                                        );
                                        TimeOfDay? timepicked = await showTimePicker(
                                          context: context, 
                                          initialTime: TimeOfDay.now()
                                          );
                                          startdatetime = DateTime(datepicked!.year,datepicked.month,datepicked.day,timepicked!.hour,timepicked.minute);
                                          setState((){});
                                      }, icon: Icon(Icons.calendar_today))
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
                                      dur!=null?
                                      dur!.inDays==0?Text("${dur!.inHours.remainder(24)}H ${dur!.inMinutes.remainder(60)}M",style: TextStyle(fontSize: 16,color: Colors.black),):
                                      Text("${dur!.inDays}D ${dur!.inHours.remainder(24)}H ${dur!.inMinutes.remainder(60)}M",style: TextStyle(fontSize: 16,color: Colors.black),)
                                      :Text(""),
                                      IconButton(onPressed: ()async{
                                        Duration? durationpicked = await showDurationPicker(
                                          context: context, 
                                          initialDuration: Duration.zero);
                                          dur = durationpicked; 
                                        setState((){});
                                      }, 
                                      icon: Icon(Icons.timer_outlined))
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
                                Text("Message",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                                Expanded(child: SizedBox(width: 1,)),
                                IconButton(
                                  onPressed: (){
                                    showDialog(context: context, builder: (context){
                                      return AlertDialog(
                                        title: Text("Enter your message"),
                                        content: TextFormField(
                                          decoration: InputDecoration(
                                            hintText: "You can give info about vehicle such as train no., bus no. and flight",
                                            hintMaxLines: 3,
                                          ),
                                          initialValue: message,
                                          minLines: null,
                                          maxLines: null,
                                          expands: true,
                                          onChanged: (val){
                                            message = val;
                                          },
                                          
                                          autofillHints: ["Train No.","Train Name","Bus No.","Bus Name","Flight Number"],
                                        ),
                                        actions: [
                                          IconButton(
                                            onPressed: (){
                                              setState((){});
                                              Navigator.of(context).pop();
                                            }, 
                                            icon: Icon(Icons.check)
                                          )
                                        ],
                                      );
                                    });
                                  }, 
                                  icon: Icon(Icons.message)
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 10,),
                                Container(
                                  width: screenwidth*0.7,
                                  child: Text(
                                    message,
                                    style: TextStyle(fontSize: 17),
                                    softWrap: true,
                                    ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Companions",style: TextStyle(color: Color(0xFF005864),fontSize: 20),),
                                      IconButton(onPressed: (){
                                        showDialog(context: context, builder: (context){
                                          String name="";
                                          return AlertDialog(
                                            title: TextFormField(
                                              onChanged: (val){
                                                name=val;
                                              },
                                            ),
                                            actions: [
                                              ElevatedButton(onPressed: (){
                                                if(name!="") friends.add(name);
                                                Navigator.of(context).pop();
                                              },
                                              child: Icon(Icons.check))
                                            ],
                                          );
                                        });
                                      }, icon: Icon(Icons.add))
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: friends.asMap().entries.map((e){
                                      return Row(
                                        children: [
                                          Text("${e.key+1}. ${e.value}",style: TextStyle(fontSize: 20),),
                                          IconButton(onPressed: (){
                                            setState(() { 
                                            friends.removeAt(e.key);
                                            });
                                          }, icon: Icon(Icons.delete))
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                ],
                                )
                              ),
                              SizedBox(height: 45,),
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.amber[900]
                                  ),
                                  onPressed: (){
                                    if(from=="" || to=="" || dur==null || modeoftravel=="" || startdatetime==null) Get.snackbar('Error',"Fill all details",snackPosition: SnackPosition.BOTTOM);
                                    else DataService().post(from, to, dur!, message, modeoftravel, startdatetime!, friends).then((value) => Navigator.of(context).pop());
                                  }, 
                                  child: Text("POST")
                                  ),
                              )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
                }));
              });
            }, 
            icon: Icon(Icons.add,size: 30,)
            ),
        ),
      ),
    );
  }
}