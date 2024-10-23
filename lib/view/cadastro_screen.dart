import 'package:first_app/models/user_model.dart';
import 'package:first_app/view/show_users_screen.dart';
import 'package:flutter/material.dart';

enum SingingCharacter { Masculino, Feminino }

class CadastroScreen extends StatefulWidget {
  CadastroScreen({super.key});

  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();

  SingingCharacter? _character = SingingCharacter.Masculino; 

  List<UserModel> users = [];

  void mostraInfo() {
    users.add(UserModel(
      email: emailController.text,
      telefone: telefoneController.text,
      endereco: enderecoController.text,
      name: nameController.text,
      genero: _character == SingingCharacter.Masculino ? 'Masculino' : 'Feminino', 
    ));

    nameController.clear();
    emailController.clear();
    telefoneController.clear();
    enderecoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 60,
          centerTitle: true,
          title: const Text(
            'CADASTRO',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite seu Nome',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite seu Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: TextField(
                controller: telefoneController,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite seu Telefone',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: TextField(
                controller: enderecoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite seu Endereço',
                ),
              ),
            ),
            const Text(
              "Gênero: ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            
            Column(
              children: [
                RadioListTile<SingingCharacter>(
                  title: Text('Masculino'),
                  value: SingingCharacter.Masculino,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
                RadioListTile<SingingCharacter>(
                  title: Text('Feminino'),
                  value: SingingCharacter.Feminino,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ],
            ),
            
            ElevatedButton(
              onPressed: () {
                mostraInfo();
              },
              child: const Text("Salvar"),
            ),
            ElevatedButton(
              onPressed: () {
                if (users.isEmpty) {
                  final snackBar = SnackBar(
                    content: const Text(
                        'Você precisa cadastrar pelo menos um usuário'),
                    action: SnackBarAction(
                      label: 'Entendido',
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ShowUsersScreen(users: users),
                    ),
                  );
                }
              },
              child: const Text("Ver"),
            ),
          ],
        ),
      ),
    );
  }
}
