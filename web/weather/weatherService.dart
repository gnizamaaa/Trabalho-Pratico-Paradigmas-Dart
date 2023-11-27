import 'dart:convert';
import 'dart:core';
import 'weatherModel.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  static const FutureWeather =
      'https://api.openweathermap.org/data/2.5/forecast';
  String apiKey = 'e39906ce4dd0b94e1f219086296ea2c9';

  WeatherService();

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

  Future<List<WeatherModel>> getFutureWeather(String city) async {
    // Cria a URL
    String url = '$FutureWeather?q=$city&cnt=3&appid=$apiKey&units=metric';

    // Obtém os dados
    var response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Erro ao obter os dados da API');
    }

    // Decodifica os dados
    var json = jsonDecode(response.body);

    // Cria o objeto WeatherModel
    List<WeatherModel> weather = [];
    weather.add(WeatherModel.fromJson(json['list'][0]));
    weather.add(WeatherModel.fromJson(json['list'][1]));
    weather.add(WeatherModel.fromJson(json['list'][2]));

    // Retorna o objeto WeatherModel
    return weather;
  }
}
