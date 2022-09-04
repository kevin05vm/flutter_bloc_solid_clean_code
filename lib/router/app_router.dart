import 'package:flutter/material.dart';

import 'package:flutter_bloc_solid_clean_code/screens/screens.dart';

class Routes {
  
  static const routeHome   = 'home_screen';
  static const routeDetail = 'detail_screen';
  
  static Map<String, Widget Function(BuildContext)> routesName = {
    routeHome   : (BuildContext context) => const HomeScreen(),
    routeDetail : (BuildContext context) => const DetailScreen()
  };
  
}