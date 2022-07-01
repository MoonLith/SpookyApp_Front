

import 'package:happytree/models/PlantData.dart';

class PlantHistory{
  late PlantData? device_data;
  late String? device_id;
  late String? sample_time;


  PlantHistory({
    required this.device_data,
    required this.device_id,
    required this.sample_time,

  });

  PlantHistory.init();

  PlantHistory.jsonData({
    required this.device_data,
    required this.device_id,
    required this.sample_time,
  });

  factory PlantHistory.fromJsonData(Map<String,  dynamic> json){
    return PlantHistory.jsonData(
      device_data: PlantData.fromJsonData(json['device_data']),
      device_id: json['device_id'],
      sample_time: json['sample_time'],

    );
  }

}
