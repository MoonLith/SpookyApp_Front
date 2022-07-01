import 'dart:convert';
import 'dart:developer';

import 'package:happytree/response/plantsresponse.dart';
import 'package:happytree/response/plantuserresponse.dart';
import 'package:http/http.dart'as http;

import '../../response/plantresponse.dart';
import '../../util/config.dart';
import '../../util/util.dart';

Future<PlantsResponse> getPlantsTypes() async{

  String token = await getCurrentUserToken();
  late http.Response response;
  const String path = "/plant/gettypes";

  try {
    var url = Uri.parse(URL+path);
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
      PlantsResponse data = PlantsResponse.fromJsonData(
          json.decode(response.body));
      print(data.message);
      return data ;
    }catch(e){
      log("ERREUR");
      print(e);
    }
    return PlantsResponse(code: json.decode(response.body)['code'], message: json.decode(response.body)['message']);


  }
  else{
    return PlantsResponse(code: json.decode(response.body)['code'], message: json.decode(response.body)['message']);
  }


}


Future<PlantResponse> getPlantTypeByName(String plantName) async{

  String token = await getCurrentUserToken();
  late http.Response response;
  const String path = "/plant/gettypebyname";
  final queryParameters = {
    "plantName": plantName,
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
