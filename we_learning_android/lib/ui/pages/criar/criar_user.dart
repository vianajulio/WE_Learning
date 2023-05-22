// import 'package:flutter/material.dart';

// class CriarUser extends StatefulWidget {
//   const CriarUser({super.key});

//   @override
//   State<CriarUser> createState() => _CriarUserState();
// }

// class _CriarUserState extends State<CriarUser> {
//   final _edtNome = TextEditingController();
//   final _edtEmail = TextEditingController();
//   final _edtSenha = TextEditingController();
//   //final _dpdTipo = TextEditingController(); --> tipo será um dropdown
//   //final _rbPierSitReg = TextEditingController(); --> tipo será um dropdown
//   final _formKey = GlobalKey<FormState>();
//   final _tipos = ['Aluno', 'Professor'];
//   bool _pierSitReg = false;
//   String? _selectedOption;
//   // seAdmin() {
//   //   // fazer um if para validar o tipo do user logado.
//   //   _tipos.add('Administrador');
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /* textfield nome */
//             Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: TextFormField(
//                 controller: _edtNome,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Nome',
//                 ),
//                 keyboardType: TextInputType.text,
//                 validator: (value) {
//                   if (value!.isEmpty || value == null) {
//                     return 'Insira algum valor válido';
//                   }
//                   return null;
//                 },
//               ),
//             ),

//             /* textfield email */
//             Padding(
//               padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
//               child: TextFormField(
//                 controller: _edtEmail,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Email',
//                 ),
//                 keyboardType: TextInputType.text,
//                 validator: (value) {
//                   if (value!.isEmpty || value == null) {
//                     return 'Insira algum valor válido';
//                   }
//                   return null;
//                 },
//               ),
//             ),

//             /* textfield senha */
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
//               child: TextFormField(
//                 controller: _edtSenha,
//                 decoration: const InputDecoration(
//                     border: OutlineInputBorder(), labelText: 'Senha'),
//                 validator: (value) {
//                   if (value!.isEmpty || value == null) {
//                     return 'Insira algum valor válido';
//                   }
//                   return null;
//                 },
//               ),
//             ),

//             /* Opções de usuário */
//             Padding(
//               padding: const EdgeInsets.fromLTRB(40, 12, 40, 12),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: DropdownButton<String>(
//                       isExpanded: true,
//                       value: _selectedOption,
//                       onChanged: (newValue) {
//                         setState(() {
//                           _selectedOption = newValue;
//                         });
//                       },
//                       items:
//                           _tipos.map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             /* Switch PierSitReg */
//             Padding(
//               padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
//               child: ListTile(
//                 title: const Text('Status'),
//                 trailing: Switch(
//                   value: _pierSitReg,
//                   onChanged: (value) {
//                     setState(() {
//                       _pierSitReg = value;
//                     });
//                   },
//                 ),
//               ),
//             ),

//             /* Botão Submit */
//             Expanded(
//               child: Container(
//                 alignment: Alignment.bottomCenter,
//                 margin: const EdgeInsets.all(24.0),
//                 child: ElevatedButton(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Icon(Icons.check),
//                       Padding(
//                         padding: EdgeInsets.all(16),
//                         child: Text('CADASRTAR',
//                             style: TextStyle(fontWeight: FontWeight.bold)),
//                       ),
//                     ],
//                   ),
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       print('Nome: ${_edtNome.text}, Email: ${_edtEmail.text}, '
//                           'Senha: ${_edtSenha.text}');
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
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
                      if (value!.isEmpty || value == null) {
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
                      if (value!.isEmpty || value == null) {
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
                      if (value!.isEmpty || value == null) {
                        return 'Insira algum valor válido';
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
                    controller: _edtSenha,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirme a senha'),
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return 'Insira algum valor válido';
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
                    items: _tipos.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

                /* Switch PierSitReg */
                SizedBox(height: 12.0),
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

                /* Botão Submit */
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.check),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              'CADASTRAR',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print(
                              'Nome: ${_edtNome.text}, Email: ${_edtEmail.text}, '
                              'Senha: ${_edtSenha.text}, Tipo: $_selectedOption, '
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
      ),
    );
  }
}
