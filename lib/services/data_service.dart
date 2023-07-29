import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataService extends GetxController{
  final _db = FirebaseFirestore.instance;

  RxList<dynamic> cards = [].obs;

  @override
  void onReady() async{
    await getcarddetails();
    // TODO: implement onReady
    super.onReady();
  }

  Future<void> getcarddetails()async{
    final docref = _db.collection("Travel_cards");
    await docref.snapshots().listen((event) {
      List<Map<String,dynamic>> lst=[];
      for(int i=0; i<event.docs.length; i++){
        lst.add(event.docs[i].data());
      }
      print(lst);
      cards.value=lst;
    });
  }




  Future<void> post(String src, String dst, Duration dur, String msg, String mode_of_transport, DateTime date_time,List<String> companions)async{
    late String dur_str;
    if(dur.inDays==0){
      dur_str = "${dur.inHours}H ${dur.inMinutes.remainder(60)}M";
    }
    else{
      dur_str = "${dur.inDays}D ${dur.inHours}H ${dur.inMinutes.remainder(60)}M";
    }
    Map<String,dynamic> card_detials={
      "Source":src,
      "Destination":dst,
      "Message":msg,
      "Duration":dur_str,
      "Mode_of_transport":mode_of_transport,
      "date_time":date_time.millisecondsSinceEpoch,
      "posted_by":[FirebaseAuth.instance.currentUser!.displayName,FirebaseAuth.instance.currentUser!.email],
      "companions":companions
    };
    await _db.collection("Travel_cards").doc().set(card_detials).onError((error, stackTrace){
      print(error);
      print(stackTrace);
    });

  }

}