import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../core/app_string.dart';


List<DonorModel> needModelList(String str) => List<DonorModel>.from(
    json.decode(str).map((x) => DonorModel.fromJson(x)));

String categoryToJson(List<DonorModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class DonorModel {
   String name;
   String mobileNumber;
   String bloodGroup;

  DonorModel(
      { this.name=AppStrings.NA,
        this.mobileNumber=AppStrings.NA,
        this.bloodGroup=AppStrings.NA,
      }
      );

  factory DonorModel.fromJson(Map<String, dynamic> json) => DonorModel(
      name: json['name']?? AppStrings.NA,
      mobileNumber: json['mobileNumber'] ?? AppStrings.NA,
      bloodGroup: json['bloodGroup'] ?? AppStrings.NA,
    );

  Map<String, dynamic> toJson() => {

    "name": name,
    "mobileNumber": mobileNumber,
    "bloodGroup":bloodGroup,
  };


}