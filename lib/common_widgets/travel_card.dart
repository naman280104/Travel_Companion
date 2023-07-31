import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_companion/services/data_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

class Travel_card extends StatefulWidget {
  final String src;
  final String dst;
  final DateTime datetime;
  final String dur;
  final String veh;
  const Travel_card(
      {super.key,
      required this.src,
      required this.dst,
      required this.datetime,
      required this.dur,
      required this.veh});

  @override
  State<Travel_card> createState() => _Travel_cardState();
}

class _Travel_cardState extends State<Travel_card> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 2, 0, 16),
      width: screensize.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0XFFCFCFCF)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              offset: Offset(
                0,
                6.0,
              ),
            ),
          ]),
      child: Wrap(
        children: [
          Container(
            width: screensize.width * 0.9,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: screensize.width * 0.4,
                  constraints: BoxConstraints(minHeight: 110),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0XFF73BCFF),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                          offset: Offset(
                            0,
                            5.0,
                          ),
                        )
                      ]),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "  From",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          height: 1,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: screensize.width * 0.3,
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              widget.src,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: screensize.width * 0.4,
                  constraints: BoxConstraints(minHeight: 110),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0XFF73BCFF),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                          offset: Offset(
                            0,
                            5.0,
                          ),
                        )
                      ]),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "  To",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          height: 1,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: screensize.width * 0.3,
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              widget.dst,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: screensize.width * 0.9,
            margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: screensize.width * 0.27,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFdfdfdf)),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                      ),
                      BoxShadow(
                        color: Color(0XFFF2F2F2),
                        blurRadius: 4.0,
                        offset: Offset(
                          0,
                          5.0,
                        ),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "On " + DateFormat('MMMd').format(widget.datetime),
                        style: TextStyle(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "At " + DateFormat('jm').format(widget.datetime),
                        style: TextStyle(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  width: screensize.width * 0.30,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFdfdfdf)),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                      ),
                      BoxShadow(
                        color: Color(0XFFF2F2F2),
                        blurRadius: 4.0,
                        offset: Offset(
                          0,
                          5.0,
                        ),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Mode of Travel",
                        style: TextStyle(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        widget.veh,
                        style: TextStyle(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Container(
                  width: screensize.width * 0.24,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFdfdfdf)),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                      ),
                      BoxShadow(
                        color: Color(0XFFF2F2F2),
                        blurRadius: 4.0,
                        offset: Offset(
                          0,
                          5.0,
                        ),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Duration",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        widget.dur,
                        style: TextStyle(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ],
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

class Travel_card_back extends StatefulWidget {
  final String displayname;
  final String email;
  final List<dynamic> companions;
  final String msg;
  final int index;
  final Function callback;
  const Travel_card_back(
      {super.key,
      required this.displayname,
      required this.email,
      required this.companions,
      required this.msg,
      required this.index,
      required this.callback});

  @override
  State<Travel_card_back> createState() => _Travel_card_backState();
}

class _Travel_card_backState extends State<Travel_card_back> {
  var dataservice = Get.put(DataService());
  Future launchmail(String toEmail) async {
    final url = Uri.parse('mailto:${toEmail}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
    else{
      print("rfed");
    }
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return IntrinsicHeight(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 2, 0, 16),
        width: screensize.width * 0.9,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xFFCFCFCF)),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 6))
            ]),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(child: Text(widget.displayname[0].toUpperCase(),style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
                SizedBox(
                  width: 10,
                ),
                // SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screensize.width*0.5,
                      child: Text(
                        widget.displayname,
                        style:
                            TextStyle(fontSize: 17, fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Text(
                      widget.email,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
                Expanded(
                    child: SizedBox(
                  width: 1,
                )),
                if (widget.email == FirebaseAuth.instance.currentUser!.email)
                  IconButton(
                      onPressed: () {
                        dataservice.delete(widget.index);
                        widget.callback();
                      },
                      icon: Icon(Icons.delete_outline))
                else
                  IconButton(
                      onPressed: () async {
                        launchmail(widget.email);
                      },
                      icon: Icon(Icons.email_outlined))
              ],
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Companions",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF4F4F4F),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      height: 90,
                      padding: EdgeInsets.all(10),
                      width: screensize.width * 0.37,
                      constraints: BoxConstraints(minHeight: 80),
                      decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.grey)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.companions.asMap().entries.map((e) {
                            return Text("${e.key + 1}. ${e.value}");
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Message",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF4F4F4F),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 90,
                      width: screensize.width * 0.37,
                      constraints: BoxConstraints(minHeight: 80),
                      decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.grey)),
                      child: SingleChildScrollView(
                        child: Text(widget.msg),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
