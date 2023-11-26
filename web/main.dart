import 'dart:html';
import 'GetCityUser.dart';
import 'weather/weatherModel.dart';
import 'weather/weatherService.dart';

void main() {
  GetCityUser teste = GetCityUser();

  WeatherService weatherService = WeatherService();
  OutputElement output = document.querySelector('#my-pred') as OutputElement;

  teste.addChangeListener((event) async {
    WeatherModel weather = await weatherService.getWeather(teste.city);
    output.text = weather.toString();
  });
}
