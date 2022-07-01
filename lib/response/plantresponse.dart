import 'dart:core';

import 'package:flutter/material.dart';
import 'package:happytree/models/PlantModel.dart';

import 'BaseResponse.dart';


class PlantResponse extends BasicResponse<PlantModel>{


  PlantResponse({ code,  message, payload}) : super(code: code, message:message, payload: payload);


  PlantResponse.jsonData({ code,  message, payload,}) :super(code: code, message: message, payload: payload);

  factory PlantResponse.fromJsonData(Map<String,  dynamic> json){
    return PlantResponse.jsonData(
      code: json['code'],
      message: json['message'],
      payload: PlantModel.fromJsonData(json['payload']),
    );
  }
}


