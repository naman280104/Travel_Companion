import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Travel_card extends StatefulWidget {
  final String src;
  final String dst;
  final DateTime datetime;
  final Duration dur;
  final String veh;
  const Travel_card({super.key, required this.src, required this.dst, required this.datetime, required this.dur, required this.veh});

  @override
  State<Travel_card> createState() => _Travel_cardState();
}

class _Travel_cardState extends State<Travel_card> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Container(
      width: screensize.width,
      padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 8),
        width: screensize.width*0.9,
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0XFFCFCFCF)),
        boxShadow:[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            offset: Offset(
              0, 
              6.0, 
            ),
          ),
        ]
      ),
      child: Wrap(
        children: [
          Container(
            width: screensize.width*0.9,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: screensize.width*0.4,
                    constraints: BoxConstraints(
                      minHeight: 110
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0XFF73BCFF),
                      boxShadow:[
                        BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        offset: Offset(
                          0, 
                          5.0, 
                        ),
                      )
                    ]
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("  From",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                          SizedBox(height: 3,),
                          Container(height: 1,color: Colors.black,),
                          SizedBox(height: 10,),
                          Container(
                            width: screensize.width*0.3,
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(widget.src,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),maxLines: 3,overflow: TextOverflow.ellipsis,)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: screensize.width*0.4,
                    constraints: BoxConstraints(
                      minHeight: 110
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0XFF73BCFF),
                      boxShadow:[
                        BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        offset: Offset(
                          0, 
                          5.0, 
                        ),
                      )
                    ]
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("  To",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                          SizedBox(height: 3,),
                          Container(height: 1,color: Colors.black,),
                          SizedBox(height: 10,),
                          Container(
                            width: screensize.width*0.3,
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(widget.dst,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),maxLines: 3,overflow: TextOverflow.ellipsis,)
                            ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: screensize.width*0.9,
            margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: screensize.width*0.27,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFdfdfdf)),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow:[
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
                        Text("On "+DateFormat('MMMd').format(widget.datetime),style: TextStyle(fontWeight: FontWeight.w500),),
                        Text("At "+DateFormat('jm').format(widget.datetime),style: TextStyle(fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                Container(
                    width: screensize.width*0.30,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFdfdfdf)),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow:[
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
                        Text("Mode of Travel",style: TextStyle(fontWeight: FontWeight.w500),),
                        Text(widget.veh,style: TextStyle(fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,)
                      ],
                    ),
                  ),
                Container(
                    width: screensize.width*0.24,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFdfdfdf)),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow:[
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
                        Text("Duration",style: TextStyle(fontWeight: FontWeight.w500),),
                        widget.dur.inDays==0?Text("${widget.dur.inHours.remainder(24)}H ${widget.dur.inMinutes.remainder(60)}M",style: TextStyle(fontWeight: FontWeight.w500),):
                        Text("${widget.dur.inDays}D ${widget.dur.inHours.remainder(24)}H ${widget.dur.inMinutes.remainder(60)}M",style: TextStyle(fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}

