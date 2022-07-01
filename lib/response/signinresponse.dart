import 'dart:core';

import 'BaseResponse.dart';


class SignInResponse extends BasicResponse{


  late String token;
  late String username;
  late String id;

  SignInResponse({ code,  message, payload}) : super(code: code, message:message, payload: payload);


  SignInResponse.jsonData({ code,  message, payload, required this.username, required this.token, required this.id}) :super(code: code, message: message, payload: payload);

  factory SignInResponse.fromJsonData(Map<String,  dynamic> json){
    return SignInResponse.jsonData(
      code: json['code'],
      message: json['message'],
      username: json['payload']['username'],
      id: json['payload']['id'],
      token: json['token'],

    );
  }
}


