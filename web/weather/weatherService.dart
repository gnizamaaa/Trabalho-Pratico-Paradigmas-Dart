import 'dart:convert';

import 'weatherModel.dart';

class WeatherService {
  static const BASE_URL =
      'https://api.openweathermap.org/data/3.0/onecall/weather';
  String apiKey = 'e39906ce4dd0b94e1f219086296ea2c9';

  WeatherService();

  get http => null;

  Future<WeatherModel> getWeather(String city) async {
    // Cria a URL
    String url = '$BASE_URL?q=$city&appid=$apiKey&units=metric';

    // Obtém os dados
    var response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Erro ao obter os dados da API');
    }

    // Decodifica os dados
    var json = jsonDecode(response.body);

    // Cria o objeto WeatherModel
    WeatherModel weather = WeatherModel.fromJson(json);

    // Retorna o objeto WeatherModel
    return weather;
  }
}
