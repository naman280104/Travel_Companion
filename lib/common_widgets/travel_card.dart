import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Travel_card extends StatefulWidget {
  const Travel_card({super.key});

  @override
  State<Travel_card> createState() => _Travel_cardState();
}

class _Travel_cardState extends State<Travel_card> {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
      width: screensize.width*0.9,
      height: 220,
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Color(0XFFCFCFCF)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          // spreadRadius: -5.0,
          blurRadius: 20.0,
          offset: Offset(
            0, 
            5.0, 
          ),
        ),
      ]
    ),
    child: Column(
      children: [
        Container(
          width: screensize.width*0.9,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: screensize.width*0.4,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0XFF8FC9FF),
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
              ),
              Container(
                width: screensize.width*0.4,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0XFF8FC9FF),
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
              )
            ],
          ),
        ),
        Container(
          width: screensize.width*0.9,
          margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  width: screensize.width*0.25,
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
                ),
              Container(
                  width: screensize.width*0.25,
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
                ),
              Container(
                  width: screensize.width*0.25,
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
                ),
            ],
          ),
        ),
      ],
    ),
  );
  }
}

