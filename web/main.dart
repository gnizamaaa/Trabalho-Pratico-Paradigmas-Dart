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

    Element image = document.querySelector('#my-present-img') as Element;
    image.setAttribute(
        'src', 'http://openweathermap.org/img/wn/${weather.icon}.png');
  });

  teste.addChangeListener((event) async {
    List<WeatherModel> weather =
        await weatherService.getFutureWeather(teste.city);

    for (var i = 0; i < weather.length; i++) {
      var element = weather[i];
      OutputElement saida =
          document.querySelector('#my-pred-day${i + 1}') as OutputElement;
      saida.text = '$element';

      Element image =
          document.querySelector('#my-pred-day${i + 1}-img') as Element;
      image.setAttribute(
          'src', 'http://openweathermap.org/img/wn/${element.icon}.png');
    }
  });
}
