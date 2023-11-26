import 'dart:html';
import 'GetCityUser.dart';
import 'weather/weatherModel.dart';
import 'weather/weatherService.dart';

void main() {
  GetCityUser teste = new GetCityUser();

  // if (teste.city != '') {
  //   WeatherService weatherService = new WeatherService();
  //   WeatherModel weather =
  //       weatherService.getWeather(teste.city) as WeatherModel;
  //   OutputElement output = document.querySelector('#my-pred') as OutputElement;
  //   output.text = weather.toString();
  // }
  WeatherService weatherService = new WeatherService();
  OutputElement output = document.querySelector('#my-pred') as OutputElement;

  teste.addChangeListener((event) async {
    var weather = await weatherService.getWeather(teste.city);
    //WeatherModel weather = WeatherModel('Cidadezona', 11.0, 'Sunny');
    output.text = weather.toString();
    // output.text = teste.city;
  });
}
