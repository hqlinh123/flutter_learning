import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/auth_repository.dart';
import 'logic/bloc/auth_bloc.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
          BlocProvider(create: (_) => AuthBloc(AuthRepository())),
        ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: appRoutes
    );
  }
}
