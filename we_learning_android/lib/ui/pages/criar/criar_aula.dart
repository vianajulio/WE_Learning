import 'package:flutter/material.dart';

class CriarAula extends StatefulWidget {
  const CriarAula({super.key});

  @override
  State<CriarAula> createState() => _CriarAulaState();
}

class _CriarAulaState extends State<CriarAula> {
  final _edtTitulo = TextEditingController();
  final _edtDescricao = TextEditingController();
  final _edtUrl = TextEditingController();
  bool _pierSitReg = false;
  final _formkey = GlobalKey<FormState>();
  String? _selectedOption;
  final _tipos = [
    'Todas categorias',
    'Teste de Software',
    'Sistemas Operacionais',
    'Requisitos e Modelagem',
    'Projeto',
    'Programação Web Back-End',
    'Programação de Dispositiveis Moveis',
    'Linguagem de Marcação',
    'Hardware e Redes',
    'Fundamentos de Programação Orientada a Objetos'
  ];

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
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: TextFormField(
                        controller: _edtTitulo,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Título'),
                        keyboardType: TextInputType.text,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Insira algum valor';
                          }
                          if (value.length < 5) {
                            return 'Coloque um título válido';
                          }
<<<<<<< HEAD
                          return null;
=======
                          return '';
>>>>>>> gabriel
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: TextFormField(
                        controller: _edtDescricao,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Descrição'),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira algum valor';
                          }
                          if (value.length < 15) {
                            return 'Coloque uma descrição válido';
                          }
<<<<<<< HEAD
                          return null;
=======
                          return '';
>>>>>>> gabriel
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: TextFormField(
                        controller: _edtUrl,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Youtube URL'),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira algum valor';
                          }
                          if (value.length < 15) {
                            return 'Coloque uma URL válida';
                          }
<<<<<<< HEAD
                          return null;
=======
                          return '';
>>>>>>> gabriel
                        },
                      ),
                    ),
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
                            if (_formkey.currentState!.validate()) {
                              print(
                                  'Nome: ${_edtTitulo.text}, Email: ${_edtDescricao.text}, '
                                  'Senha: ${_edtUrl.text}, Tipo: ${_tipos.indexOf(_selectedOption!) + 1}, '
                                  'PierSitReg: $_pierSitReg');
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
