

class PlantData{
  late String? temperature;
  late String? humidity;
  late String? luminosity;
  late String? humidity_soil;

  PlantData({
    required this.temperature,
    required this.humidity,
    required this.luminosity,
    required this.humidity_soil,
  });

  PlantData.init();

  PlantData.jsonData({
    required this.temperature,
    required this.humidity,
    required this.luminosity,
    required this.humidity_soil,
  });

  factory PlantData.fromJsonData(Map<String,  dynamic> json){
    return PlantData.jsonData(
      temperature: json['temperature'],
      humidity: json['humidity'],
      luminosity: json['luminosity'],
      humidity_soil: json['humidity_soil'],


    );
  }

}
