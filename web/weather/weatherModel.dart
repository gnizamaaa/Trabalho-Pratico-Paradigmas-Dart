class WeatherModel {
  String city = '';
  double temp = 0;
  String mainCondition = '';

  WeatherModel(this.city, this.temp, this.mainCondition);

  WeatherModel.fromJson(Map<String, dynamic> json) {
    city = json['name'];
    temp = json['main']['temp'];
    mainCondition = json['weather'][0]['main'];
  }

  String toString() {
    return 'Cidade: $city, Temperatura: $temp, Condição: $mainCondition';
  }
}
