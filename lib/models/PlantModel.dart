

class PlantModel{
late String? id;
late String? name_flower;
late String? origin;
late String? category;
late String? bloomingperio;
late String? sunlightLike;
late String? max_light_mmol4500;
late String? min_light_mmol2500;
late String? max_light_lux30000;
late String? min_light_lux3700;
late String? max_temp;
late String? min_temp;
late String? max_env_humid80;
late String? min_env_humid30;
late String? max_soil_moist;
late String? min_soil_moist;
late String? max_soil_ec;
late String? min_soil_ec;
late String? periode;
late String? luminosite;

PlantModel({
    required this.id,
    required this.name_flower,
    required this.origin,
    required this.category,
    required this.bloomingperio,
    required this.sunlightLike,
    required this.max_light_mmol4500,
    required this.min_light_mmol2500,
    required this.max_light_lux30000,
    required this.min_light_lux3700,
    required this.max_temp,
    required this.min_temp,
    required this.max_env_humid80,
    required this.min_env_humid30,
    required this.max_soil_moist,
    required this.min_soil_moist,
    required this.max_soil_ec,
    required this.min_soil_ec,
    required this.periode,
    required this.luminosite
});

PlantModel.init();

  PlantModel.jsonData({
  required this.id,
  required this.name_flower,
  required this.origin,
  required this.category,
  required this.bloomingperio,
  required this.sunlightLike,
  required this.max_light_mmol4500,
  required this.min_light_mmol2500,
  required this.max_light_lux30000,
  required this.min_light_lux3700,
  required this.max_temp,
  required this.min_temp,
  required this.max_env_humid80,
  required this.min_env_humid30,
  required this.max_soil_moist,
  required this.min_soil_moist,
  required this.max_soil_ec,
  required this.min_soil_ec,
  required this.periode,
  required this.luminosite
});

factory PlantModel.fromJsonData(Map<String,  dynamic> json){
  return PlantModel.jsonData(
    id: json['id'],
    origin: json['origin'],
   category: json['category'],
   bloomingperio: json['bloomingperio'],
   sunlightLike: json['sunlightLike'],
   max_light_mmol4500: json['max_light_mmol4500'],
   min_light_mmol2500: json['min_light_mmol2500'],
   max_light_lux30000: json['max_light_lux30000'],
   min_light_lux3700: json['min_light_lux3700'],
   max_temp: json['max_temp'],
   min_temp: json['min_temp'],
   max_env_humid80: json['max_env_humid80'],
   min_env_humid30: json['min_env_humid30'],
   max_soil_moist: json['max_soil_moist'],
   min_soil_moist: json['min_soil_moist'],
   max_soil_ec: json['max_soil_ec'],
   min_soil_ec: json['min_soil_ec'],
   periode: json['periode'],
    name_flower:  json['name_flower'],
    luminosite:   json['luminosite'],

  );
}

}
