class LoginValidator {
  String? validateLogin(String? value) {
    if (value == null || value.isEmpty) {
      return "Preencha o campo.";
    }
    if (!value.contains('@') || !value.contains('senai')) {
      return "Utilize um e-mail válido.";
    }
    return null;
  }

  String? validateSenha(String? value) {
    if (value == null || value.isEmpty) {
      return "Preencha o campo.";
    }
    return null;
  }
}
