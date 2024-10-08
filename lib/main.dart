import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_task/cubit/list_cubit.dart';
import 'package:list_task/screens/page_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'list cubit',
      home: BlocProvider(
        create: (_) => ListCubit(),
        child: const PageMain(),
      ),
    );
  }
}
