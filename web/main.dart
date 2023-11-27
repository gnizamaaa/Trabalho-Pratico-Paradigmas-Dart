import 'dart:html';
import 'GetCityUser.dart';
import 'weather/weatherModel.dart';
import 'weather/weatherService.dart';

void main() {
  GetCityUser teste = GetCityUser();

  WeatherService weatherService = WeatherService();
  OutputElement present =
      document.querySelector('#my-present') as OutputElement;

  teste.addChangeListener((event) async {
    WeatherModel weather = await weatherService.getWeather(teste.city);
    present.text = '$weather\n ';
  });

  String textaoTempos = '';
  OutputElement future = document.querySelector('#my-pred') as OutputElement;
  teste.addChangeListener((event) async {
    List<WeatherModel> weather =
        await weatherService.getFutureWeather(teste.city);

    for (var element in weather) {
      textaoTempos += '$element \n';
    }
    future.text = textaoTempos;
  });
}
