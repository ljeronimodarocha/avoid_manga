import 'package:avoid_manga/config/dependencies.dart';
import 'package:avoid_manga/domain/dtos/credentials.dart';
import 'package:avoid_manga/domain/validators/credentials_validator.dart';
import 'package:avoid_manga/main.dart';
import 'package:avoid_manga/ui/auth/viewmodels/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:routefly/routefly.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    viewModel.login.addListener(_listenable);
    viewModel.usuarioLogado.addListener(_listenableLoggedUser);
    viewModel.usuarioLogado.execute();
  }

  final viewModel = injector.get<LoginViewModel>();
  final validator = CredentialsValidator();
  Credentials credentials = Credentials();

  void _listenableLoggedUser() {
    if (viewModel.usuarioLogado.isSuccess) {
      var retorno = viewModel.usuarioLogado.value as SuccessCommand;
      if (retorno.value == true) Routefly.navigate(routePaths.home);
    }
  }

  void _listenable() {
    if (viewModel.login.isSuccess) {
      Routefly.navigate(routePaths.home);
    } else if (viewModel.login.isFailure) {
      final error = viewModel.login.value as FailureCommand;
      final snackBar = SnackBar(
        content: Text("Erro ao logar ${error.error.toString()}"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void didUpdateWidget(covariant LoginPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    viewModel.login.addListener(_listenable);
  }

  @override
  void dispose() {
    viewModel.login.removeListener(_listenable);
    super.dispose();
  }

  Future<void> _login() async {
    await viewModel.login.execute(credentials);

    if (viewModel.login.isSuccess && !viewModel.login.isFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Successful')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
          listenable: viewModel.usuarioLogado,
          builder: (context, _) {
            if (!viewModel.usuarioLogado.isSuccess && viewModel.usuarioLogado.isFailure) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: credentials.setUsername,
                            validator:
                                validator.byField(credentials, 'username'),
                            decoration: const InputDecoration(
                              labelText: 'Username',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: credentials.setPassword,
                            validator:
                                validator.byField(credentials, 'password'),
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: credentials.seClienteID,
                            validator:
                                validator.byField(credentials, 'clientId'),
                            decoration: const InputDecoration(
                              labelText: 'Cliente ID',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onChanged: credentials.setClientSecret,
                            validator:
                                validator.byField(credentials, 'clientSecret'),
                            decoration: const InputDecoration(
                              labelText: 'Client Secret',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          ListenableBuilder(
                              listenable: viewModel.login,
                              builder: (context, _) {
                                return ElevatedButton(
                                  onPressed: viewModel.login.isRunning
                                      ? null
                                      : () {
                                          if (validator
                                              .validate(credentials)
                                              .isValid) {
                                            _login();
                                          }
                                        },
                                  child: const Text('Login'),
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
