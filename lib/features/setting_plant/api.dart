import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

import '../../response/BaseResponse.dart';
import '../../response/signinresponse.dart';
import '../../util/config.dart';
import '../../util/util.dart';

Future<BasicResponse> createPlante(String plantName, String plantId) async{
  const String path = "/plant/add";
  String token = await getCurrentUserToken();
  http.Response response;

  Map data =  {
    'deviceId' : "1",
    'plantName' : plantName,
    'plantId' : plantId,
  };
  try {

    var url = Uri.parse(URL+path);
    response = await http.post(url,
        headers: {"Content-type": "application/json",'Authorization': 'Bearer '+ token},
        body: json.encode(data));
  }
  catch (e) {
    print(e.toString());
    return BasicResponse(code: 1, message: "Erreur serveur", payload: null);
  }

  if(response.statusCode == 201) {
    BasicResponse data = BasicResponse.fromJsonData(json.decode(response.body));
    print(json.decode(response.body));

    return data ;
  }
  else{
    var message;
    try{
      message = json.decode(response.body)['message'];
    }catch(e){
      message = "Une erreur est survenue";
    }
    return BasicResponse(code: json.decode(response.body)['code'], message: message, payload: null);
  }


}
