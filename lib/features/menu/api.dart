import 'dart:convert';
import 'dart:developer';

import 'package:happytree/response/plantuserresponse.dart';
import 'package:http/http.dart'as http;

import '../../util/config.dart';
import '../../util/util.dart';

Future<PlantUserResponse> getPlantUser() async{

  String token = await getCurrentUserToken();
  late http.Response response;
  const String path = "/plant/get";

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
      PlantUserResponse data = PlantUserResponse.fromJsonData(
          json.decode(response.body));
      print(data.message);
      return data ;
    }catch(e){
      log("ERREUR");
      print(e);
    }
    return PlantUserResponse(code: json.decode(response.body)['code'], message: json.decode(response.body)['message']);


  }
  else{
    return PlantUserResponse(code: json.decode(response.body)['code'], message: json.decode(response.body)['message']);
  }


}
