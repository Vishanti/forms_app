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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({super.key});

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  // Como se esta manejando con otro gestor de estado no es necesario tener las propiedades
  // Principalmente no es necesario un StatefulWidget
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String username = '';
  // String email = '';
  // String password = '';
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Nombre de usuario',
              onChanged: (p0) {
                registerCubit.usernameChanged(p0);
                _formKey.currentState?.validate();
              },
              validator: (p0) {
                if (p0 == null || p0.isEmpty) return 'Campo Requerido';
                if (p0.trim().isEmpty) return 'Campo Requerido';
                if (p0.length < 3) return 'Más de 3 letras';
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Correo electronico',
              onChanged: (p1) {
                registerCubit.emailChanged(p1);
                _formKey.currentState?.validate();
              },
              validator: (p1) {
                if (p1 == null || p1.isEmpty) return 'Campo Requerido';
                if (p1.trim().isEmpty) return 'Campo Requerido';
                final emailRegExp = RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                );
                if (!emailRegExp.hasMatch(p1)) {
                  return 'No tiene formato de correo';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
              onChanged: (p2) {
                registerCubit.passwordChanged(p2);
                _formKey.currentState?.validate();
              },
              validator: (p2) {
                if (p2 == null || p2.isEmpty) return 'Campo Requerido';
                if (p2.trim().isEmpty) return 'Campo Requerido';
                if (p2.length < 3) return 'Más de 6 letras';
                return null;
              },
            ),
            const SizedBox(height: 20),
            FilledButton.tonalIcon(
                onPressed: () {
                  // final isValid = _formKey.currentState?.validate();
                  // if (!isValid!) return;
                  registerCubit.onSubmit();
                },
                icon: const Icon(Icons.save),
                label: const Text('Crear Usuario')),
          ],
        ));
  }
}
