import 'dart:core';

import 'package:flutter/material.dart';
import 'package:happytree/models/PlantModel.dart';

import '../models/PlantHistoryModel.dart';
import 'BaseResponse.dart';


class PlantsHistoriesResponse extends BasicResponse{

  late List<PlantHistory>? histories;

  PlantsHistoriesResponse({ code,  message, payload}) : super(code: code, message:message, payload: payload);


  PlantsHistoriesResponse.jsonData({ code,  message, payload, required this.histories,
  }) :super(code: code, message: message, payload: payload);

  factory PlantsHistoriesResponse.fromJsonData(Map<String,  dynamic> json){
    return PlantsHistoriesResponse.jsonData(
      code: json['code'],
      message: json['message'],
      histories:  (json['payload'] as List).map((e) => PlantHistory.fromJsonData(e)).toList(),
    );
  }
}


