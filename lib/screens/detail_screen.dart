import 'package:flutter/material.dart';

import 'package:flutter_bloc_solid_clean_code/utils/colors_app.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: colorAppBar,
        title: const Text('Regresar')
      ),
      body: const SafeArea(child: Center(child: Text('Detalle screen')))
    );
  }
}