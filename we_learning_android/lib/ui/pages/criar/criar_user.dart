import 'package:flutter/material.dart';
import 'package:we_learning_android/entities/user.dart';

class CriarUser extends StatefulWidget {
  const CriarUser({Key? key}) : super(key: key);

  @override
  State<CriarUser> createState() => _CriarUserState();
}

class _CriarUserState extends State<CriarUser> {
  final _edtNome = TextEditingController();
  final _edtEmail = TextEditingController();
  final _edtSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _tipos = ['Aluno', 'Professor'];
  bool _pierSitReg = false;
  String? _selectedOption;

  @override
  void initState() {
    _pierSitReg = true;
    _selectedOption = _tipos[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 1.15,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.account_circle, size: 250.0),
                    /* textfield nome */
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: TextFormField(
                        controller: _edtNome,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nome',
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira algum valor válido';
                          }
                          return null;
                        },
                      ),
                    ),

                    /* textfield email */
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: TextFormField(
                        controller: _edtEmail,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira algum valor válido';
                          }
                          return null;
                        },
                      ),
                    ),

                    /* textfield senha1 */
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: TextFormField(
                        obscureText: true,
                        controller: _edtSenha,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Senha'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira algum valor válido';
                          } else if (value.contains('@gmail.com') ||
                              value.contains('@hotmail.com')) {
                            return 'Insira um e-mail válido com gmail.com ou hotmail.com';
                          }
                          return null;
                        },
                      ),
                    ),

                    /* textfield senha2 */
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirme a senha'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira algum valor válido';
                          } else if (value != _edtSenha.text) {
                            return 'Diferente da primeira senha';
                          }
                          return null;
                        },
                      ),
                    ),

                    /* Opções de usuário */
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 12.0),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _selectedOption,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedOption = newValue;
                          });
                        },
                        items: _tipos
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),

                    /* Switch PierSitReg */
                    const SizedBox(height: 12.0),
                    ListTile(
                      title: const Text('Status'),
                      trailing: Switch(
                        value: _pierSitReg,
                        onChanged: (value) {
                          setState(() {
                            _pierSitReg = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 54),
                    /* Botão Submit */
                    Flexible(
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: ElevatedButton(
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  'CADASTRAR',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              User usuario = User(
                                  id: 0,
                                  name: _edtNome.text,
                                  email: _edtEmail.text,
                                  password: _edtSenha.text,
                                  registerDate: DateTime.now().toString(),
                                  userType: _tipos.indexOf(_selectedOption!),
                                  pierSitReg: _pierSitReg ? 'ATV' : 'DES');
                              print('${usuario.toJson()}');
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
