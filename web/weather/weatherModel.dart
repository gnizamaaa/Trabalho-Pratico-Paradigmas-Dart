class WeatherModel {
  double temp = 0;
  double feelsLike = 0;
  double tempMin = 0;
  double tempMax = 0;
  String mainCondition = '';

  WeatherModel(this.temp, this.mainCondition);

  WeatherModel.fromJson(Map<String, dynamic> json) {
    //city = json['name'];
    temp = json['main']['temp'];
    mainCondition = json['weather'][0]['main'];
    feelsLike = json['main']['feels_like'];
    tempMin = json['main']['temp_min'];
    tempMax = json['main']['temp_max'];
  }

  @override
  String toString() {
    return 'Temperatura: $temp, Condição: $mainCondition, Sensação Térmica: $feelsLike, Temperatura Mínima: $tempMin, Temperatura Máxima: $tempMax';
  }
}
