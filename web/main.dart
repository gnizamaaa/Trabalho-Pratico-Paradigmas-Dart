import 'dart:html';

void main() {
  // Carrega o campo de texto
  var input = document.querySelector('#my-input') as InputElement;

  // Adiciona um evento onchange
  input.onChange.listen((event) {
    // Obtém o texto digitado pelo usuário
    String? text = input.value;

    document.querySelector('#my-output')!.text = text;
  });
}
