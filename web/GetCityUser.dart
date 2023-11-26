import 'dart:html';

class GetCityUser {
  String city = '';
  GetCityUser() {
    // Carrega o campo de texto
    InputElement input = document.querySelector('#my-input') as InputElement;

    // Carrega o output
    OutputElement output =
        document.querySelector('#my-output') as OutputElement;

    // Adiciona um evento onchange
    input.onChange.listen((event) {
      // Obtém o texto digitado pelo usuário
      String? text = input.value;

      // Atualiza o output
      output.text = text;
      city = text!;
    });
  }
}
