import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_solid_clean_code/bloc/home/home_bloc.dart';

import 'package:flutter_bloc_solid_clean_code/router/app_router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc()..add(LoadMemes(const [])),
        )
      ],
      child: MaterialApp(
        title                      : 'Meme APP',
        debugShowCheckedModeBanner : false,
        initialRoute               : Routes.routeHome,
        routes                     : Routes.routesName
      )
    );
  }
}