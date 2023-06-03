class LoginValidator {
  String? validateLogin(String? value) {
    if (value == null || value.isEmpty) {
      return "Preencha o campo.";
    }
    if (!value.contains('@') || !value.contains('senaisp')) {
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

  String? sendEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Preencha o campo de e-mail";
    }
    if (!value.contains('@') || !value.contains('.com')) {
      return "Utilize um e-mail válido.";
    }
    return null;
  }
}
