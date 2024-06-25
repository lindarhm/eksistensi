import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd/presentation/bloc/product_bloc.dart';
import 'package:tdd/presentation/pages/main_page.dart';
import 'injection.dart' as di;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<ProductBloc>(),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: MainPage(),
      ),
    );
  }
}
