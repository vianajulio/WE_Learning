class CriarTopicoValidator {
  static String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return "Preencha o campo.";
    }
    if (value.length < 5) {
      return "Digite mais que 5 caracteres.";
    }
    return null;
  }


}