import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../authentication/component/show_snackbar.dart';
import '../authentication/services/auth_service.dart';
import 'home.page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool isEntering = true;

  final _formKey = GlobalKey<FormState>();

  AuthService authService = AuthService();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool isLoggedIn = false;

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: 50,
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(35),
                  ),
                ),
                child: TextButton(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 36,
                          width: 100,
                          child: Image.asset(
                            "assets/facebook.png",
                          ),
                        ),
                        const Text("Entrar com Facebook"),
                      ],
                    ),
                    onPressed: () {}),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(35),
                  ),
                ),
                child: TextButton(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 36,
                        width: 100,
                        child: Image.asset(
                          "assets/google.png",
                        ),
                      ),
                      const Text("Entrar com Google"),
                    ],
                  ),
                  onPressed: () async {
                    UserCredential? userCredential = await signInWithGoogle();
                    if (userCredential != null) {
                      // Login bem-sucedido, navegue para a tela inicial
                      //Navigator.push(context,
                      //    MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      // Login falhou
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Falha no login. Tente novamente.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: const Text(
                  "- ou -",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 15,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        autofocus: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "E-mail",
                          labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                        validator: (value) {
                          if (value == null || value == "") {
                            return 'Um e-mail válido deve ser preenchido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                        validator: (value) {
                          if (value == null || value.length < 4) {
                            return 'Insira uma senha válida';
                          }
                          return null;
                        },
                      ),
                      Visibility(
                        visible: isEntering,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              forgotPasswordClicked();
                            },
                            child: const Text(
                              "Esqueceu sua senha?",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: !isEntering,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _confirmController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Confirme a senha",
                                labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                              ),
                              validator: (value) {
                                if (value == null || value.length < 5) {
                                  return "Insira uma confirmação de senha válida.";
                                }
                                if (value != _passwordController.text) {
                                  return "As senhas devem ser iguais.";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: "Nome",
                                labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                              ),
                              validator: (value) {
                                if (value == null || value.length < 3) {
                                  return "Insira um nome maior.";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(35),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    buttonSendClicked();
                  },
                  child: Text((isEntering) ? "Entrar" : "Cadastrar"),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isEntering = !isEntering;
                  });
                },
                child: Text(
                  (isEntering)
                      ? "Ainda não tem conta?\nClique aqui para cadastrar."
                      : "Já tem uma conta?\nClique aqui para se entrar",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buttonSendClicked() {
    String email = _emailController.text;
    String password = _passwordController.text;
    String name = _nameController.text;

    if (_formKey.currentState!.validate()) {
      if (isEntering) {
        _loginUser(email: email, password: password);
      } else {
        _createUser(email: email, password: password, name: name);
      }
    }
  }

  _loginUser({required String email, required String password}) {
    authService
        .loginUser(email: email, password: password)
        .then((String? error) {
      if (error != null) {
        showSnackBar(context: context, message: error);
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
  }

  _createUser(
      {required String email, required String password, required String name}) {
    authService
        .createUser(email: email, password: password, name: name)
        .then((String? error) {
      if (error != null) {
        showSnackBar(context: context, message: error);
      } else {        
        _setEnteringState(true);
      }
    });
  }

  _setEnteringState(bool isEntering) {
    setState(() {
      this.isEntering = isEntering;
    });
  }

  forgotPasswordClicked() {
    String email = _emailController.text;
    showDialog(
      context: context,
      builder: (contex) {
        TextEditingController resetPasswordController =
            TextEditingController(text: email);
        return AlertDialog(
          title: const Text("Confirme o e-mail para redefinição de senha"),
          content: TextFormField(
            controller: resetPasswordController,
            decoration: const InputDecoration(label: Text("Confirme o email")),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32))),
          actions: [
            TextButton(
              onPressed: () {
                authService
                    .sendPasswordReset(email: resetPasswordController.text)
                    .then((String? error) {
                  if (error == null) {
                    showSnackBar(
                      context: context,
                      message: "E-mail de redefinição enviado!",
                      isError: false,
                    );
                  } else {
                    showSnackBar(context: context, message: error);
                  }
                  Navigator.pop(context);
                });
              },
              child: const Text("Redefinir senha"),
            ),
          ],
        );
      },
    );
  }

  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      return null;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await _auth.signInWithCredential(credential);
  }
}
