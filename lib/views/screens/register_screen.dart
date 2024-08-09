// lib/screens/register_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/auth_bloc/auth_event.dart';
import '../../blocs/auth_bloc/auth_state.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: RegisterForm(),
    );
  }
}

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          TextField(
            controller: confirmPasswordController,
            decoration: InputDecoration(labelText: 'Confirm Password'),
            obscureText: true,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final name = nameController.text;
              final email = emailController.text;
              final password = passwordController.text;
              final confirmPassword = confirmPasswordController.text;
              BlocProvider.of<AuthBloc>(context).add(
                AuthRegisterRequested(
                  name,
                  email,
                  password,
                  confirmPassword,
                ),
              );
            },
            child: Text('Register'),
          ),
          SizedBox(height: 16),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Text(
              'Already have an account? Login here',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is AuthSuccess) {
                return Text('Success: ${state.message}', style: TextStyle(color: Colors.green));
              } else if (state is AuthFailure) {
                return Text('Error: ${state.error}', style: TextStyle(color: Colors.red));
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
