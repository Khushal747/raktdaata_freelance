  import 'dart:convert';

  import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/app_string.dart';

  class NeedModel {
    String docId; // Add a property to hold the document ID
    DateTime date;
    String patientName;
    String bloodGroup;
    String disease;
    String attendersName;
    String city;
    String mobileNumber;
    String hospitalName;
    String bloodUnits;
    String prescriptionUrl;

    NeedModel({
       this.docId=AppStrings.NA, // Add docId to the constructor
       required this.date,
       this.patientName=AppStrings.NA,
       this.bloodGroup=AppStrings.NA,
       this.disease=AppStrings.NA,
       this.attendersName=AppStrings.NA,
       this.city=AppStrings.NA,
       this.mobileNumber=AppStrings.NA,
       this.hospitalName=AppStrings.NA,
       this.bloodUnits=AppStrings.NA,
       this.prescriptionUrl=AppStrings.NA,
    });

    factory NeedModel.fromJson(Map<String, dynamic> json,String docId) {
      return NeedModel(
        docId: docId,
        date: (json['date'] as Timestamp).toDate(), // Convert Timestamp to DateTime
        patientName: json['patientName']?? AppStrings.NA,
        bloodGroup: json['bloodGroup'] ?? AppStrings.NA,
        disease: json['disease']?? AppStrings.NA,
        attendersName: json['attendersName']?? AppStrings.NA,
        city: json['city']?? AppStrings.NA,
        mobileNumber: json['mobileNumber']?? AppStrings.NA,
        hospitalName: json['hospitalName']?? AppStrings.NA,
        bloodUnits: json['bloodUnits']?? AppStrings.NA,
        prescriptionUrl: json['prescriptionUrl']?? AppStrings.NA,
      );
    }

    Map<String, dynamic> toJson() {
      return {
        'docId': docId,       //docId
        'date': date,
        'patientName': patientName,
        'bloodGroup': bloodGroup,
        'disease': disease,
        'attendersName': attendersName,
        'city': city,
        'mobileNumber': mobileNumber,
        'hospitalName': hospitalName,
        'bloodUnits': bloodUnits,
        'prescriptionUrl': prescriptionUrl,
      };
    }
  }

  // class Date {
  //   int seconds;
  //   int nanoseconds;
  //
  //   Date({
  //     required this.seconds,
  //     required this.nanoseconds,
  //   });
  //
  //   factory Date.fromJson(Map<String, dynamic> json) {
  //     return Date(
  //       seconds: json['seconds'],
  //       nanoseconds: json['nanoseconds'],
  //     );
  //   }
  //
  //   Map<String, dynamic> toJson() {
  //     return {
  //       'seconds': seconds,
  //       'nanoseconds': nanoseconds,
  //     };
  //   }
  // }

  // List<NeedModel> categoryModelList(String str) =>
  //     List<NeedModel>.from(json.decode(str).map((x) => NeedModel.fromJson(x)));

  List<NeedModel> needModelList(String str) {
    List<dynamic> decodedList = json.decode(str);
    return List<NeedModel>.from(decodedList.map((x) {
      // Assuming x contains a 'docId' field
      return NeedModel.fromJson(x, x['docId']);
    }));
  }


  String categoryToJson(List<NeedModel> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
