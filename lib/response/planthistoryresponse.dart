import 'dart:core';

import 'package:flutter/material.dart';
import 'package:happytree/models/PlantHistoryModel.dart';
import 'package:happytree/models/PlantModel.dart';

import 'BaseResponse.dart';


class PlantHistoryResponse extends BasicResponse<PlantHistory>{


  PlantHistoryResponse({ code,  message, payload}) : super(code: code, message:message, payload: payload);


  PlantHistoryResponse.jsonData({ code,  message, payload,}) :super(code: code, message: message, payload: payload);

  factory PlantHistoryResponse.fromJsonData(Map<String,  dynamic> json){
    return PlantHistoryResponse.jsonData(
      code: json['code'],
      message: json['message'],
      payload: PlantHistory.fromJsonData(json['payload']),
    );
  }
}


