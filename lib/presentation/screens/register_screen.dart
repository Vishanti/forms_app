import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({super.key});

  // Como se esta manejando con otro gestor de estado no es necesario tener las propiedades
  // Principalmente no es necesario un StatefulWidget

  // * EL key no es necesario ya que no va delegar la funcionalidad de validate
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // *

  // String username = '';
  // String email = '';
  // String password = '';

  // * Se cambia a StateLess debido a que no tendremos que manejar estado, eso lo hace el gestor

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;
    return Form(
      // key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: (p0) {
              registerCubit.usernameChanged(p0);
              // _formKey.currentState?.validate();
            },
            errorMessage: username.errorMessage,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Correo electronico',
            onChanged: (p1) {
              registerCubit.emailChanged(p1);
              // _formKey.currentState?.validate();
            },
            errorMessage: email.errorMessage,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: (p2) {
              registerCubit.passwordChanged(p2);
              // _formKey.currentState?.validate();
            },
            errorMessage: password.errorMessage,
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              // final isValid = _formKey.currentState?.validate();
              // if (!isValid!) return;
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Crear Usuario'),
          ),
        ],
      ),
    );
  }
}
