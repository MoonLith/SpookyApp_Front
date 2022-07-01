import 'dart:core';

import 'package:flutter/material.dart';

import 'BaseResponse.dart';


class PlantUserResponse extends BasicResponse{
  late String? id;
  late String? username;
  late String? plant_name;
  late String? id_plant;
  late bool? plant_death;
  late String? id_user;
  late String? device_id;

  PlantUserResponse({ code,  message, payload}) : super(code: code, message:message, payload: payload);


  PlantUserResponse.jsonData({ code,  message, payload, required this.username, required this.id,
    required this.plant_name,required this.id_plant,required this.plant_death,required this.id_user,required this.device_id}) :super(code: code, message: message, payload: payload);

  factory PlantUserResponse.fromJsonData(Map<String,  dynamic> json){
    return PlantUserResponse.jsonData(
      code: json['code'],
      message: json['message'],
      id: json['payload']['id'],
      username: json['payload']['username'],
      plant_name: json['payload']['plant_name'],
      plant_death: json['payload']['plant_death'],
      id_plant: json['payload']['id_plant'],
      id_user: json['payload']['id_user'],
      device_id: json['payload']['device_id'],
    );
  }
}


