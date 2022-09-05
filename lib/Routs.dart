

import 'package:flutter/material.dart';
import 'package:music_sara_demo/Data/Models/SearchResultScreenModel.dart';

import 'Presentation/Screens/DetailsScreen.dart';
import 'Presentation/Screens/SearchResultScreen.dart';
import 'Presentation/Screens/SearchScreen.dart';

class AppRoute{
  Route onGenerateRoute(RouteSettings routeArguments){
    switch(routeArguments.name){
      case '/':
        return MaterialPageRoute(builder: (context) => SearchScreen());
      case 'DetailsScreen':
        return  MaterialPageRoute(builder: (context)=>DetailsScreen(routeArguments.arguments!));
      case 'SearchResultScreen':
        return MaterialPageRoute(builder: (context)=>SearchResultScreen(searchResultScreenModel:routeArguments.arguments as SearchResultScreenModel));
      default :
        return MaterialPageRoute(builder: (context) => SearchScreen());
    }
  }
}