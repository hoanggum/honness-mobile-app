import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honness/views/screens/home_screen.dart';
import 'blocs/auth_bloc/auth_bloc.dart';
import 'repositories/auth_repository.dart';
import 'services/auth_service.dart';
import 'views/screens/login_screen.dart';
import 'views/screens/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String baseUrl = 'http://10.0.2.2:8000';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            AuthRepository(
              authService: AuthService(baseUrl: baseUrl),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Auth App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(), // Hoặc bạn có thể chọn RegisterScreen() để thử nghiệm
        routes: {
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
