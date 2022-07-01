import 'dart:core';

import 'package:flutter/material.dart';
import 'package:happytree/models/PlantModel.dart';

import 'BaseResponse.dart';


class PlantsResponse extends BasicResponse{

  late List<PlantModel>? plants;

  PlantsResponse({ code,  message, payload}) : super(code: code, message:message, payload: payload);


  PlantsResponse.jsonData({ code,  message, payload, required this.plants,
}) :super(code: code, message: message, payload: payload);

  factory PlantsResponse.fromJsonData(Map<String,  dynamic> json){
    return PlantsResponse.jsonData(
      code: json['code'],
      message: json['message'],
      plants:  (json['payload'] as List).map((e) => PlantModel.fromJsonData(e)).toList(),
    );
  }
}


