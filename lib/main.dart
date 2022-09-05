
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Data/Repo/search_repo.dart';
import 'Logic/Bloc/music_bloc/search_bloc.dart';
import 'Routs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appGenerateRoute=AppRoute();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>SearchBloc(SearchRepo()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _appGenerateRoute.onGenerateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
      ),
    );
  }
}



