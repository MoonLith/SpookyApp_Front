import 'dart:convert';
import 'dart:developer';

import 'package:happytree/response/baseresponse.dart';
import 'package:happytree/response/planthistoriesresponse.dart';
import 'package:happytree/response/planthistoryresponse.dart';
import 'package:happytree/response/plantresponse.dart';
import 'package:http/http.dart'as http;


import '../../util/config.dart';
import '../../util/util.dart';

Future<PlantHistoryResponse> getPlantHistoryById(String deviceId) async{

  String token = await getCurrentUserToken();
  late http.Response response;
  const String path = "/plant/history";


  final queryParameters = {
    "deviceId": deviceId,
  };
  try {
    var url = Uri.parse(URL+path).replace(queryParameters: queryParameters);
    response = await http.get(url,
        headers: {"Content-type": "application/json",'Authorization': 'Bearer '+ token});
  }
  catch (e) {
    print(e.toString());

    return json.decode(response.body);
  }

  if(response.statusCode == 200) {
    log("OK " + response.statusCode.toString());
    print(jsonDecode(response.body));
    try{
      PlantHistoryResponse data = PlantHistoryResponse.fromJsonData(
          json.decode(response.body));
      print(data.message);
      return data ;
    }catch(e){
      log("ERREUR");
      print(e);
    }
    return PlantHistoryResponse(code: json.decode(response.body)['code'], message: json.decode(response.body)['message']);


  }
  else{
    return PlantHistoryResponse(code: json.decode(response.body)['code'], message: json.decode(response.body)['message']);
  }


}

Future<PlantsHistoriesResponse> getPlantHistoriesById(String deviceId) async{

  String token = await getCurrentUserToken();
  late http.Response response;
  const String path = "/plant/histories";


  final queryParameters = {
    "deviceId": deviceId,
  };
  try {
    var url = Uri.parse(URL+path).replace(queryParameters: queryParameters);
    response = await http.get(url,
        headers: {"Content-type": "application/json",'Authorization': 'Bearer '+ token});
  }
  catch (e) {
    print(e.toString());

    return json.decode(response.body);
  }

  if(response.statusCode == 200) {
    log("OK " + response.statusCode.toString());
    print(jsonDecode(response.body));
    try{
      PlantsHistoriesResponse data = PlantsHistoriesResponse.fromJsonData(
          json.decode(response.body));
      print(data.message);
      return data ;
    }catch(e){
      log("ERREUR");
      print(e);
    }
    return PlantsHistoriesResponse(code: json.decode(response.body)['code'], message: json.decode(response.body)['message'], payload: null);


  }
  else{
    return PlantsHistoriesResponse(code: json.decode(response.body)['code'], message: json.decode(response.body)['message']);
  }


}

Future<PlantResponse> getPlantById(String plantId) async{

  String token = await getCurrentUserToken();
  late http.Response response;
  const String path = "/plant/gettypebyid";


  final queryParameters = {
    "plantId": plantId,
  };
  try {
    var url = Uri.parse(URL+path).replace(queryParameters: queryParameters);
    response = await http.get(url,
        headers: {"Content-type": "application/json",'Authorization': 'Bearer '+ token});
  }
  catch (e) {
    print(e.toString());

    return json.decode(response.body);
  }

  if(response.statusCode == 200) {
    // log("OK " + response.statusCode.toString());
    // print(jsonDecode(response.body));
    try{
      PlantResponse data = PlantResponse.fromJsonData(
          json.decode(response.body));
      print(data.message);
      return data ;
    }catch(e){
      log("ERREUR");
      print(e);
    }
    return PlantResponse(code: json.decode(response.body)['code'], message: json.decode(response.body)['message']);


  }
  else{
    return PlantResponse(code: json.decode(response.body)['code'], message: json.decode(response.body)['message']);
  }


}


Future<BasicResponse> killPlantById(String plantUserId) async{

  String token = await getCurrentUserToken();
  late http.Response response;
  const String path = "/plant/kill";


  final data = {
    "plantUserId": plantUserId,
  };
  try {
    var url = Uri.parse(URL+path);
    response = await http.put(url,
        headers: {"Content-type": "application/json",'Authorization': 'Bearer '+ token},  body: json.encode(data));
  }
  catch (e) {
    print(e.toString());

    return json.decode(response.body);
  }

  if(response.statusCode == 200) {
    log("OK " + response.statusCode.toString());
    print(jsonDecode(response.body));
    try{
      BasicResponse data = BasicResponse.fromJsonData(
          json.decode(response.body));
      print(data.message);
      return data ;
    }catch(e){
      log("ERREUR");
      print(e);
    }
    return BasicResponse(code: json.decode(response.body)['code'], message: json.decode(response.body)['message'], payload: null);


  }
  else{
    return BasicResponse(code: json.decode(response.body)['code'], message: json.decode(response.body)['message'], payload: null);
  }


}
