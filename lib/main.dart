import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(RootPage());
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login' : (context) => LoginPage(),
        '/menu' : (context) => MenuPage(),
        '/cadastro' : (context) => CadastroPage(),
        '/modifica' : (context) => ModificaPage(),
        '/excluir' : (context) => ExcluiPage(),
        '/exemplovisual' : (context) => ExemploVisualColumn(),
      },
      initialRoute: '/login',
    );
  }
}

void showMessage(BuildContext context, String message) {
  showDialog(context: context,
      builder: (context) {
        return Dialog(
            child: Container(
              height: 160.0,
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(message,
                    textAlign: TextAlign.center,),
                  SizedBox(
                    height: 20.0,
                  ),
                  FlatButton(
                    color: Colors.blue,
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            )
        );
      });
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerLogin = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacer(),
              Center(
                child: Text('Sistema de Exemplo - Login',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Spacer(),
              Text('Login'),
              TextFormField(
                controller: controllerLogin,
              ),
              SizedBox(
                height: 16.0,
              ),
              Text('Senha'),
              TextFormField(
                controller: controllerSenha,
              ),
              Spacer(),
              FlatButton(
                onPressed: () {
                  String login = controllerLogin.text;
                  String senha = controllerSenha.text;
                  if (login=='pablo@visiotech.com.br' && senha=='1234') {
                    Navigator.pushNamed(context, '/menu');
                  } else {
                    showMessage(context, 'Acesso negado!');
                  }
                },
                color: Colors.blue,
                child: Text('Login'),
              ),
              Spacer(),
            ],
          ),
        )
      )
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacer(),
              Row(
                children: <Widget>[
                  FlatButton(
                    child: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Text('MENU PRINCIPAL',
                      textAlign: TextAlign.center,),
                  ),
                ],
              ),
             
              Spacer(),
              FlatButton(
                color: Colors.blue,
                child: Text('Cadastro de Usuário'),
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastro');
                },
              ),
              Spacer(),
              FlatButton(
                color: Colors.blue,
                child: Text('Modificação de Usuário'),
                onPressed: () {
                  Navigator.pushNamed(context, '/modifica');
                },
              ),
              Spacer(),
              FlatButton(
                color: Colors.blue,
                child: Text('Exclusão de Usuário'),
                onPressed: () {
                  Navigator.pushNamed(context, '/excluir');
                },
              ),
              Spacer(),
            ],
          ),
        )
      )
    );
  }
}

class CadastroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text('Tela de Cadastro')),
      ),
    );
  }
}

class ModificaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text('Tela de Modificação')),
      ),
    );
  }
}

class ExcluiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text('Tela de Exclusão')),
      ),
    );
  }
}



class ExemploVisualColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(),
                Text('A'),
                Spacer(),
                Text('B'),
                Spacer(),
                Text('C'),
                Spacer(),
                Text('D'),
                Spacer(),
              ]
          ),
        ),
      ),
    );
  }
}


class ExemploVisualStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text('A')
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Text('B')
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('C')
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text('D')
              ),
            ]
          ),
        ),
      ),
    );
  }
}


class Exemplo extends StatefulWidget {
  @override
  _ExemploState createState() => _ExemploState();
}

class _ExemploState extends State<Exemplo> {
  String nome = '';
  bool alertaTamanho = false;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacer(),
              TextFormField(
                controller: controller,
                onChanged: (texto) {
                  setState(() {
                    if (texto.length<8) {
                      alertaTamanho = true;
                    } else {
                      alertaTamanho = false;
                    }
                  });

                },
              ),
              alertaTamanho?Text('O minimo de caracteres é 8!',
              style: TextStyle(
                color: Colors.red
              )):Container(),
              Spacer(),
              Center(child: Text(nome==''?'Sem nome!':'Seu nome é $nome')),
              Spacer(),
              FlatButton(
                onPressed: () {
                  setState(() {
                    nome = 'João da Silva';
                  });

                },
                color: nome=='João da Silva'?Colors.blue:Colors.red,
                child: Text('João da Silva'),
              ),
              Spacer(),
              FlatButton(
                onPressed: () {
                  setState(() {
                    nome = 'Maria das Flores';
                  });

                },
                color: nome=='Maria das Flores'?Colors.blue:Colors.red,
                child: Text('Maria das Flores'),
              ),
              Spacer(),
              FlatButton(
                onPressed: () {
                  setState(() {
                    nome = '';
                  });

                },
                color: nome==''?Colors.blue:Colors.red,
                child: Text('Remover nome'),
              ),
              Spacer(),
              FlatButton(
                onPressed: () {
                  setState(() {
                    nome = controller.text;
                  });

                },
                color: Colors.green,
                child: Text('Interage com entrada'),
              ),
              Spacer(),
            ],
          ),
        ),
      )
    );
  }
}



class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              Text('Hello World!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),),
              Spacer(),
              Text('Einstein Limeira',
              style: TextStyle(
                fontSize: 20.0,
              ),),
              SizedBox(
                height: 30.0,
              ),
              Icon(Icons.lock, color: Colors.amber, size: 50.0,),
              SizedBox(
                height: 30.0,
              ),
              FlatButton(
                color: Colors.orange,
                child: Text('Teste',
                  style: TextStyle(
                      color: Colors.white
                  ),),
                onPressed: () {

                },
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  Spacer(),
                  FlatButton(
                    color: Colors.blue,
                    child: Text('A'),
                    onPressed: () {

                    },
                  ),
                  Spacer(),
                  FlatButton(
                    color: Colors.red,
                    child: Text('B'),
                    onPressed: () {

                    },
                  ),
                  Spacer(),
                ],
              ),
              Spacer(),
            ],
        ),
      ),
    );
  }
}

